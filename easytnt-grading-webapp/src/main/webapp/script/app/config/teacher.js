(function(){
	"use strict";
	define(['jquery','ajaxwrapper','ui'],function($,ajaxWrapper,ui){
		var Teacher = function(){
			this.teacherName = '';
			this.teacherAccount = '';
			this.teacherPassord ='';
			this.leader= 0;
			this.subject = {};
		};
		var subject = function(){
			this.id = '';
			this.name = '';
		};
		
		var editorForm = function($form){
			this.Teacher = {},
			this.isNew =  true,
			//获取表单的各个参数
			this.show = function(teacher){
				this.Teacher = teacher;
				this.isNew  = false;
			};
			
			//验证表单
			this.validate = function(){
				var b = true;
				//TODO
				return b;
			};
			
			//保存响应
			this.save = function(){
				if(this.validate()){
					var amount = $("#amount").val();					
					if(amount * 1 < 1){
						amount = 1;
					}
					var teacher = {name:$('#teacherName').val(),subject:{id:$('#subject').val()}};
					ajaxWrapper.postJson("/teacher/"+amount ,teacher,
						{beforeMsg:{tipText:"",show:false},successMsg:{tipText:"创建成功",show:true}},
						function(data){
							if(data.status.success){
								setTimeout(function(){
									location.reload();
								},1000);
							}
						}
					);
				}
			};
			
			//修改响应
			this.update = function(){
				if(this.validate()){
					var teacher = {name:$('#teacherName').val(),subject:{id:$('#subject').val()}};
					ajaxWrapper.putJson("/teacher",teacher,{beforeMsg:{tipText:"",show:false},successMsg:{tipText:"更新成功",show:true}},function(data){
						if(data.status.success){
							setTimeout(function(){
								location.reload();
							},1000);
						}
					});
				}
			};
			
			var self = this;
			$form.submit(function(){
				if(self.isNew){
					self.save();
				}else{
					self.update();
				}
				return false;
			});
		};
		
		
		
		var o = function(){
			var myTable = $('div.subject-container>table');
			var  $form = $('div.subject-container>.subject-editor>form');
			var myForm = new editorForm($form);
			ui.pretty($form);
			logger.log('1111');
			var currentTeacher = {
				isNew:false,
				row:undefined,
				o:undefined,
				show:function(){
					this.o = {
						name:this.row.find(''),
						teacherId:this.row.find(''),
						subject:{
							id:this.row.find()
						}
					};
					myForm.show(this);
				}
			};
			

			myTable.on('click','tbody tr td a[data-rr-name=teacher]',function(e){
				currentTeacher.row = $(this).parent().parent();
				currentTeacher.show();
			});
			$form.show();
		};

		return {
			render:function(){
				return new o();
			}
		};
	});
})();