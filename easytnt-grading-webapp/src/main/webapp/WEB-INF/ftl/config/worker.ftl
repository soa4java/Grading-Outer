<div class="subject-container">
  <table class="table table-striped table-bordered ">
  	<thead class="bg-primary">
  	  <tr>
  	    <th>科目</th><th>姓名</th><th>账号</th><th>操作</th>
  	  </tr>
  	</thead>
  	<tbody>
  	 <#list teachers as t>
  	  <tr >
  	    <td><a href="javascript:void(0);" data-rr-name="teacher" data-rr-value="${t.teacherId}">${t.subject.name!}</a></td>
  	    <td>${t.teacherName!}</td>
  	    <td>${t.teacherAccount!}</td>
  	    <td><a href="javascript:void(0);">修改密码</a>|<a href="javascript:void(0);">分配任务</a></td>
  	  </tr>
  	  </#list>
  	  <tr class="bg-warning">
  	    <td></td>
  	    <td></td>
  	    <td><a href="#"></a></td>
  	    <td><a href="#"></td>
  	  </tr>
  	</tbody>
  </table>
  
  <div class="subject-editor">
	<div class="col-md-4"></div>
	<form class="form-horizontal col-md-4">
	  <div class="form-group">
	    <label for="teacher" class="col-sm-4 control-label">科目</label>
	    <div class="col-sm-8">
	    <p></p>
	    <select id="subject">
	     <#list subjects as subject>
	    	<option value="${subject.id}">${subject.name!}</option>
	     </#list>
	    </select>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="teacherName" class="col-sm-4 control-label">姓名</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="teacherName" id="teacherName" placeholder="姓名">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="teacherAccount" class="col-sm-4 control-label">账号</label>
	    <div class="col-sm-8">
	      <input type="text" readonly="readonly" class="form-control" id="teacherAccount"  placeholder="账号">
	    </div>
	  </div> 
	  <div class="form-group">
	    <label for="accounts" class="col-sm-4 control-label">账号数量</label>
	    <div class="col-sm-4">
	      <input type="text"  class="form-control" id="amount"  value="1" placeholder="账号数量">
	    </div>
	    <label class="control-label "><input type="checkbox"  id="isLeader" name="isLeader" value="1">组长</label>	
	   </div>
	   <div class="form-group">
	   <div class="col-sm-offset-3 col-sm-9">
	     <button type="submit" class="btn btn-default">保存</button>
	   </div>
	  </div>
	</form>
	<div class="col-md-4"></div>
  </div>	
</div>