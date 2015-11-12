package com.easytnt.grading.service;

import com.easytnt.commons.entity.service.EntityService;
import com.easytnt.grading.domain.grade.Teacher;
/**
 * 科目的具体操作服务类
 * 
 * @author 钟水林 20151109
 *
 */
public interface TeacherService extends EntityService<Teacher, Long> {
	
	public void create(Teacher teacher,int amount);
	
	//修改密码
	public void updatePass(Long teacheckid,String pass);
}
