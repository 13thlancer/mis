package com.mis.mapper;

import com.mis.entity.Article;
import com.mis.entity.MessageType;

import java.util.List;

/**
 * Created by admin on 2016/10/13.
 */
public interface ArticleMapper {

    int addArticle(Article article);

    List<Article> showArticle(String messagetype);

    List<MessageType> showType(int pnum);

    Article showArticleById(String id);

    void updateArticle(Article article);

    int statusoff(String id);

    int statuson(String id);

    void delete(String id);

}
