package com.mis.service;

import com.mis.entity.Lawyer;

import java.util.List;

/**
 * Created by admin on 2016/11/1.
 */
public interface LawyerServiceI {
    List<Lawyer> showLawyer(String mtype);

    void addLawyer(Lawyer lawyer);
}
