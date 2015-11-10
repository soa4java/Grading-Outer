<div class="subject-container">
  <table class="table table-striped table-bordered ">
  	<thead class="bg-primary">
  	  <tr>
  	    <th>科目</th><th>试卷量</th><th>答题卡原图</th><th>操作</th><th>切割块</th><th>满分</th><th>客观题满分</th><th>主观题满分</th><th>导入情况</th><#--<th>删除</th>-->
  	  </tr>
  	</thead>
  	<tbody>
  	<#if resultList??>
	  	<#list resultList as result>
	  	  <tr>
	  	    <td><a href="#" data-rr-name="subjectName" data-rr-value="${result.subject.subjectCode}" data-rr-testId="${result.testId}">${result.subject.name}</a></td>
	  	    <td>0</td>
	  	    <td><a href="#" id="addImage"><i class="icon-plus"></i></a></td>
	  	    <td>
	  	    	<div class="btn-group">
				  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    操作<span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu">
				    <li><a href="#" id="updateSubject">更新</a></li>
				    <li><a href="#" id="removeSubject">删除</a></li>
				  </ul>
				</div>
	  	    </td>
	  	    <#if result.usedPaper??>
		  	    <#list result.usedPaper as usedPaper>
		  	    	<#if usedPaper.sections ?size = 0>
		  	    		<td><a href="#">设计切割方案</a></td>
		  	    		<#else>
		  	    		<td><a href="#">${usedPaper.sections ?size}</a></td>
		  	    	</#if>
		  	    	<td>${usedPaper.fullScore}</td>
		  	    	<td>${usedPaper.objectivityScore}</td>
		  	    	<td>${usedPaper.subjectivityScore}</td>
		  	    </#list>
	  	    </#if>
	  	    <td class="completed">
	  	    <i class=" icon-ok"></i></td>
	  	    <#--
	  	    <td>
	  	    <a href="#" id="removeSubject"><i class="icon-minus"></i></a></td>-->
	  	  </tr>
	  	</#list>
  	</#if>	    	
  	  <tr class="bg-warning">
  	    <td><a href="#" id="newSubject"><i class="icon-plus"></i></a></td><td>0</td><td><a href="#">设计切割方案</a></td><td>0</td><td>0</td><td>0</td><td class="doing"></td>
  	  </tr>
  	</tbody>
  </table>
  <div class="subject-editor">
	<div class="col-md-4"></div>
	<form class="form-horizontal col-md-4">
	  <div class="form-group">
	    <label for="subjectName" class="col-sm-4 control-label">科目名称</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="name" placeholder="科目名称">
	      <input type="hidden" class="form-control" id="subjectCode">
	      <input type="hidden" class="form-control" id="testId">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="fullScore" class="col-sm-4 control-label">满分</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="fullScore" data-rr-type="number" placeholder="科目满分">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="objectivityScore" class="col-sm-4 control-label">客观题满分</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="objectivityScore" data-rr-type="number" placeholder="客观题满分">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="`subjectivityScore`" class="col-sm-4 control-label">主观题满分</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="subjectivityScore" data-rr-type="number" placeholder="主观题满分">
	    </div>
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