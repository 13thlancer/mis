package com.mis.serviceImpl;

import com.mis.entity.Lawyer;
import com.mis.mapper.LawyerMapper;
import com.mis.service.LawyerServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2016/11/1.
 */
@Service("lawyerService")
public class LawyerServiceImpl implements LawyerServiceI {

    @Autowired
    private LawyerMapper lawyerMapper;

    @Override
    public List<Lawyer> showLawyer(String mtype) {
        return lawyerMapper.showLawyer(mtype);
    }

    @Override
    public void addLawyer(Lawyer lawyer) {
        lawyerMapper.addLawyer(lawyer);
    }


}
