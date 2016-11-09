package com.mis.Utils;

import com.mis.entity.Requireorder;
import net.sf.json.JSONArray;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 2016/9/8.
 */
public class Lucene {
    public void createIndexFile(List<Requireorder> list){
        IndexWriter indexWriter = null;
        try {
            //分词器
            Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_36);
            //创建版本IndexWriterConfig
            IndexWriterConfig indexWriterConfig = new IndexWriterConfig(Version.LUCENE_36, analyzer);
            //设置每次创建都重新创建
            indexWriterConfig.setOpenMode(IndexWriterConfig.OpenMode.CREATE);
            // 创建系统文件
            Directory directory = new SimpleFSDirectory(new File("E:\\index"));
            indexWriter = new IndexWriter(directory, indexWriterConfig);

            for(int i = 0;i<list.size();i++){
            //indexWriter添加索引
                Document doc = new Document();
            //文本添加内容
                doc.add(new Field("id",list.get(i).getId(), Field.Store.YES, Field.Index.ANALYZED));
                doc.add(new Field("userid",list.get(i).getUserid(), Field.Store.YES, Field.Index.ANALYZED));
                doc.add(new Field("username",list.get(i).getUsername(), Field.Store.YES, Field.Index.ANALYZED));
                doc.add(new Field("num",list.get(i).getNum(), Field.Store.YES, Field.Index.ANALYZED));
                doc.add(new Field("requirename",list.get(i).getRequirename(), Field.Store.YES, Field.Index.ANALYZED));
                doc.add(new Field("requiredate",list.get(i).getRequiredate().toString(), Field.Store.YES, Field.Index.ANALYZED));
                doc.add(new Field("requiretype",list.get(i).getRequiretype(), Field.Store.YES, Field.Index.ANALYZED));
                doc.add(new Field("requirestatus",list.get(i).getRequirestatus(), Field.Store.YES, Field.Index.ANALYZED));
                doc.add(new Field("conname",list.get(i).getConname(), Field.Store.YES, Field.Index.ANALYZED));
                doc.add(new Field("conphone",list.get(i).getConphone(), Field.Store.YES, Field.Index.ANALYZED));
                doc.add(new Field("company",list.get(i).getCompany(), Field.Store.YES, Field.Index.ANALYZED));
                indexWriter.addDocument(doc);
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            if(indexWriter != null){
                try {
                    indexWriter.commit();
                    indexWriter.close();

                } catch (CorruptIndexException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
    }

    public List search(List<Requireorder> list,String queryString) throws IOException, ParseException, java.text.ParseException {

        createIndexFile(list);
        FSDirectory fs = FSDirectory.open(new File("E:\\index"));

        IndexReader ir = IndexReader.open(fs);
        long start = System.currentTimeMillis();
        IndexSearcher search = new IndexSearcher(ir);

        String key = queryString;
        String fields[] = new String[]{"id","userid","username","num","requirename","requiredate","requiretype","requirestatus","conname","conphone","company"};

        Analyzer ik = new StandardAnalyzer(Version.LUCENE_36);
        MultiFieldQueryParser m = new MultiFieldQueryParser(Version.LUCENE_36, fields,ik);
        m.setDefaultOperator(QueryParser.Operator.AND);

        Query query = m.parse(key);
        ScoreDoc[] hits = search.search(query, null,1000).scoreDocs;
        List<Requireorder> rlist = new ArrayList<Requireorder>();
        System.out.println("共找到"+hits.length+"条记录");

        for(ScoreDoc scoreDoc:hits)
            {
                Document doc = search.doc(scoreDoc.doc);
                Requireorder order = new Requireorder();
                order.setId(doc.get("id"));
                order.setUserid(doc.get("userid"));
                order.setUsername(doc.get("username"));
                order.setNum(doc.get("num"));
                order.setRequirename(doc.get("requirename"));
                order.setRequiretype(doc.get("requiretype"));
                order.setRequirestatus(doc.get("requirestatus"));
                order.setCompany(doc.get("company"));
                order.setConname(doc.get("conname"));
                order.setConphone(doc.get("conphone"));
                order.setRequiredate(doc.get("requiredate"));
//				JSONArray json = JSONArray.fromObject(order);
                rlist.add(order);
//				System.out.println(json);
//				System.out.println(scoreDoc.score + "\t id:"+doc.get("id")+"\t userid:"+doc.get("userid")+"\t username:"+doc.get("username")+"\t num:"+doc.get("num")+"\t requirename:"+doc.get("requirename")+"\t requiredate:"+doc.get("requiredate")+"\t requiretype:"+doc.get("requiretype")+"\t requirestatus:"+doc.get("requirestatus")+"\t conname:"+doc.get("conname")+"\t conphone:"+doc.get("conphone")+"\t company:"+doc.get("company"));
            }
        JSONArray Jlist = new JSONArray().fromObject(rlist);
        System.out.println(Jlist);
        System.out.println("执行时间:"+(System.currentTimeMillis()-start)+"毫秒");
        return Jlist;
    }

}
