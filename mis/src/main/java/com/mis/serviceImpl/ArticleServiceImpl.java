package com.mis.serviceImpl;


import com.mis.entity.Article;
import com.mis.entity.MessageType;
import com.mis.mapper.ArticleMapper;
import com.mis.service.ArticleServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by admin on 2016/10/13.
 */
@Service("ArticleService")
public class ArticleServiceImpl implements ArticleServiceI {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public void addArticle(String pp, String title, String content, int type) {
        Article article = new Article();
        Date date = new Date();
        String uuid = UUID.randomUUID().toString();
        article.setArticleId(uuid);
        article.setContent(content);
        article.setTitle(title);
        article.setTitlePicpath(pp);
        article.setMessagetype(type);
        article.setSeq(0);
        article.setStatus(0);
        article.setCreateTime(date);
        article.setCreatorid("管理员");
        articleMapper.addArticle(article);
    }

    @Override
    public List<Article> showArticle(String messagetype) {

        String mtype = messagetype.substring(0,1);
        return articleMapper.showArticle(mtype);
    }

    @Override
    public Article showArticleById(String id) {
        return articleMapper.showArticleById(id);
    }

    @Override
    public void updateArticle(String id, String title, String content, int type, int seq, String pp) {
        Article article = new Article();
        Date date = new Date();
        article.setArticleId(id);
        article.setContent(content);
        article.setTitle(title);
        article.setTitlePicpath(pp);
        article.setMessagetype(type);
        article.setSeq(seq);
        article.setUpdateTime(date);
        articleMapper.updateArticle(article);
    }

    @Override
    public List<MessageType> showType(int pnum) {
        return articleMapper.showType(pnum);
    }

    @Override
    public void StatusOn(String id) {
        articleMapper.statuson(id);
    }

    @Override
    public void StatusOff(String id) {
        articleMapper.statusoff(id);
    }
}
