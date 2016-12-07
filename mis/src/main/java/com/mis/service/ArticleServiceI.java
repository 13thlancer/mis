package com.mis.service;

import com.mis.entity.Article;
import com.mis.entity.MessageType;

import java.util.List;

/**
 * Created by admin on 2016/10/13.
 */
public interface ArticleServiceI {

    void addArticle(String titlepicpath,String title,String content,int type);

    List<Article> showArticle(String messagetype);

    Article showArticleById(String id);

    void updateArticle(String id,String title,String content,int typ,int seq,String titlepicpath);

    List<MessageType> showType(int pnum);

    void statusOn(String id);

    void statusOff(String id);

    void delete(String id);

}