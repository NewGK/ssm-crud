<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 员工添加模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        			<h4 class="modal-title" id="myModalLabel">新增员工</h4>
      			</div>
      			<div class="modal-body">
        			<form class="form-horizontal">
					  <div class="form-group">
					    <label class="col-sm-2 control-label">empName</label>
					    <div class="col-sm-10">
					      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
					      <span class="help-block"></span>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-sm-2 control-label">email</label>
					    <div class="col-sm-10">
					      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@newgk.com">
					      <span class="help-block"></span>
					    </div>
					  </div>
					  <div class="form-group">
					  	<label class="col-sm-2 control-label">gender</label>
					  	<label class="radio-inline">
						  <input type="radio" name="gender" id="gender_add_input" value="M" checked="checked"> 男
						</label>
						<label class="radio-inline">
						  <input type="radio" name="gender" id="gender_add_input" value="F"> 女
						</label>
					  </div> 
					  <div class="form-group">
					  	<label class="col-sm-2 control-label">deptName</label>
						<div class="col-sm-4">
							<select class="form-control" name="dId">
							</select>
						</div>
					  	
					  </div> 
					</form>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        			<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	<!-- 员工修改模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        			<h4 class="modal-title">员工修改</h4>
      			</div>
      			<div class="modal-body">
        			<form class="form-horizontal">
					  <div class="form-group">
					    <label class="col-sm-2 control-label">empName</label>
					    <div class="col-sm-10">
					      <p class="form-control-static" id="empName_update_static"></p>
					      <span class="help-block"></span>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-sm-2 control-label">email</label>
					    <div class="col-sm-10">
					      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@newgk.com">
					      <span class="help-block"></span>
					    </div>
					  </div>
					  <div class="form-group">
					  	<label class="col-sm-2 control-label">gender</label>
					  	<label class="radio-inline">
						  <input type="radio" name="gender" id="gender_add_input" value="M" checked="checked"> 男
						</label>
						<label class="radio-inline">
						  <input type="radio" name="gender" id="gender_add_input" value="F"> 女
						</label>
					  </div> 
					  <div class="form-group">
					  	<label class="col-sm-2 control-label">deptName</label>
						<div class="col-sm-4">
							<select class="form-control" name="dId">
							</select>
						</div>
					  	
					  </div> 
					</form>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        			<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
      			</div>
    		</div>
  		</div>
	</div>

	<!-- 搭建页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_model_btn">新增</button>
				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
					
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area">
				
			</div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		var totalRecord, currentPage;
	
		//1、页面加载完成以后，直接去发送ajax请求，要到分页数据
		$(function() {
			to_page(1);
		});
		
		function to_page(pn) {
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn=" + pn,
				type:"get",
				success:function(result){
					//console.log(result);
					//1、解析并显示员工数据
					build_emps_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		
		function build_emps_table(result) {
			$("#emps_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps,function(index,item){
				var checkBoxTd = $("<td></td>").append("<input type='checkbox' class='check_item'/>");
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>").append(item.department.deptName);
				var editBtn = $("<button></button>").addClass(
				"btn btn-primary btn-sm edit_btn").append(
				$("<span></span>").addClass(
					"glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前员工id
				editBtn.attr("edit_id", item.empId);
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加属性表示id
				delBtn.attr("del_id", item.empId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				//append方法执行完返回原来的元素
				$("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd).append(btnTd).appendTo("#emps_table tbody");	
			});
		}
		
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总共"+result.extend.pageInfo.pages+"页，总共"+result.extend.pageInfo.total+"条记录");
			totalRecord = result.extend.pageInfo.total;
			//更新员工信息后，需返回显示当前页
			currentPage = result.extend.pageInfo.pageNum;
		}
		
		function build_page_nav(result){
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}
			if(result.extend.pageInfo.hasNextPage == false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				lastPageLi.click(function(){
					to_page(result.extend.pageInfo.pages);
				});
				nextPageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum + 1);
				});
			}
			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
				if(result.extend.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		//清空表单样式及内容
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-success has-error");
			$(ele).find(".help-block").text("");
		}
		
		//点击新增按钮弹出模态框
		$("#emp_add_model_btn").click(function(){
			
			//清空表单
			reset_form("#empAddModal form");
			
			//发送ajax请求，查出部门信息，显示在下拉列表中
			getDepts("#empAddModal select");
			$("#empAddModal").modal({
				backdrop:false
			});
		});
		//查出所有的部门信息并显示在下拉列表中
		function getDepts(ele){
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"GET",
				success:function(result){
					//部门数据
					//console.log(result);
					//$("#dept_add_select").append("");
					 $.each(result.extend.depts,function(){
						var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
						optionEle.appendTo(ele);
					}); 
				}
			});
		}
		
		function show_validate_msg(ele, status, msg) {
			//首先清空当前元素
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
			}
			$(ele).next("span").text(msg);
		}
		
		function validate_add_form(){
			//1、拿到校验数据，使用正则表达式
			var empName = $("#empName_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!regName.test(empName)){
				//清空之前的样式
				show_validate_msg("#empName_add_input", "error", "用户名为2-5中文或4-16英文数字组合");
				return false;
			} else {
				show_validate_msg("#empName_add_input", "success", "");
			}
			//2、校验邮箱
			var email = $("#email_add_input").val();
			var regemail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regemail.test(email)){
				show_validate_msg("#email_add_input", "error", "邮箱格式错误");
				return false;
			} else {
				show_validate_msg("#email_add_input", "success", "");
			}
			return true;
		}
		
		$("#empName_add_input").change(function(){
			//发送Ajax请求用户名是否可用
			var empName = this.value;
			$.ajax({
				url:"${APP_PATH}/checkuser",
				data:"empName=" + empName,
				type:"POST",
				success:function(result){
					if(result.code == 100){
						show_validate_msg("#empName_add_input", "success","用户名可用");
						$("#emp_save_btn").attr("ajax-va","success");
					} else{
						show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
						$("#emp_save_btn").attr("ajax-va","error");
					}	
				}
			});
		});
		
		$("#emp_save_btn").click(function(){
			//1、模态框中填写的表单数据提交给服务器进行保存
			//1、先对数据进行校验
			if(!validate_add_form()){
				return false;
			}
			//姓名重复校验结果
			if($(this).attr("ajax-va") == "error"){
				return false;
			}
			//2、发送Ajax请求
			$.ajax({
				url:"${APP_PATH}/emp",
				type:"POST",
				data:$("#empAddModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						//alter(result.msg);
						//员工保存成功，关闭模态框到末页
						$("#empAddModal").modal('hide');
						//发送Ajax到最后一页
						to_page(totalRecord);
					} else{
						//显示失败信息
						console.log(result);
						//有哪个字段错误就显示哪个错误
						if(undefind != result.extend.errorFields.email){
							//显示邮箱错误信息
							show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
						}
						if(undefind != result.extend.errorFields.empName){
							//显示姓名信息
							show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
						}
					}
					
				}
			});
			
		});
		
		$(document).on("click", ".edit_btn", function(){
			//查出部门信息，显示部门列表
			getDepts("#empUpdateModal select");
			//查出员工信息
			getEmp($(this).attr("edit_id"));
			//传递id
			$("#emp_update_btn").attr("edit_id", $(this).attr("edit_id"));
			$("#empUpdateModal").modal({
				backdrop:false
			});
		});
		
		function getEmp(id){
			$.ajax({
				url:"${APP_PATH}/emp/" + id,
				type:"GET",
				success:function(result){
					console.log(result);
					//{"code":100,"msg":"处理成功！","extend":{"emp":{"empId":3,"empName":"张建国","gender":"M","email":"820193452@qq.com","dId":1,"department":null}}}
					var empData = result.extend.emp;
					$("#empName_update_static").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModal input[name=gender]").val(
							[empData.gender]);
					$("#empUpdateModal select").val([empData.dId]);
				}
			});
		}
		
		//点击更新
		$("#emp_update_btn").click(function(){
			//校验
			var email = $("#email_update_input").val();
			var regemail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regemail.test(email)){
				show_validate_msg("#email_update_input", "error", "邮箱格式错误");
				return false;
			} else {
				show_validate_msg("#email_update_input", "success", "");
			}
			//保存数据
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("edit_id"),
				type:"PUT",
				data:$("#empUpdateModal form").serialize(),
				success: function() {
					// alert(result.msg);
					$("#empUpdateModal").modal("hide");
					to_page(currentPage);
				}
			});
		});
		
		$(document).on("click", ".delete_btn", function(){
			//弹出确认删除对话框
			//alert($(this).parents("tr").find("td:eq(1)").text());
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			var empId = $(this).attr("del_id");
			if(confirm("确认删除【" + empName +"】吗？")){
				//确认
				$.ajax({
					url:"${APP_PATH}/emp/"+empId,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				});
			}
		});
		
		//全选
		$("#check_all").click(function(){
			//prop：原生属性可获取
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//check_item，复选框选择操作
		$(document).on("click", ".check_item", function() {
			//判断当前选择中的元素是否选满
			var flag = $(".check_item:checked").length == $(".check_item").length;
			$("#check_all").prop("checked", flag);
		});
		
		$("#emp_delete_all_btn").click(function() {
			var empNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"), function() {
				//组装员工字符串
				empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
				//组织员工id字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
			});
			//去除empnames多月的","
			empNames = empNames.substring(0, empNames.length - 1);
			//去除员工删除id多余的-
			del_idstr = del_idstr.substring(0, del_idstr.length - 1);
			if (confirm("确认删除【" + empNames + "】吗？")) {
				//发送ajax请求
				$.ajax({
					url: "${APP_PATH}/emp/" + del_idstr,
					type: "DELETE",
					success: function(result) {
						alert(result.msg);
						//回到当前页面
						to_page(currentPage);
						$("#check_all").prop("checked", false);
					}
				});

			}
		});
		
	</script>
</body>
</html>