<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>睿信集团  &mdash;  睿信集团</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
  
  <!-- Template CSS -->
  <link rel="stylesheet" href="../../../assets/css/style.css">
  <link rel="stylesheet" href="../../../assets/css/components.css">
  <link rel="stylesheet" href="../../../assets/css/multiplepage.css">
  <link rel="stylesheet" href="../../../assets/css/jquery-ui.css">

</head>

<body>
<jsp:include page="../userMenu.jsp" />
<!-- Main Content -->
      <div class="main-content" id="openaccount">
        <section class="section">
          <div class="section-header">
            <h1>时间表</h1>
          </div>
		  <!--PEN CONTENT -->	
           <div class="row">
              <div class="col-12">
                <div class="card ">
                  <div class="card-header">
                    <h4>公司AAA</h4>
                    <div class="card-header-form">
                      <form>
                        <div class="input-group">
                          <input type="text" class="form-control" placeholder="Search">
                          <div class="input-group-btn">
                            <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>		  
							<div class="row">
						            <div class="col-12 col-md-12 col-lg-12" id="readyContent">
						                <div class="card downLoadFile">
						                	<div class="card-body">
						                    	<div id="accordion">
						                      		<div class="accordion">
								                        <div class="accordion-header collapsible1" role="button" data-toggle="collapse" data-target="#panel-body-1" aria-expanded="true">
								                         	<h4>时间表</h4>
								                        </div>
								                        <div class="accordion-body collapse show" id="panel-body-1" data-parent="#accordion">
										                <div class="card">
										                  <div class="card-body">
										                  
<table id="recordTable" class="table table-sm">
      <tr>
			<th scope="col">服务项目</th>
			<th scope="col">注册时间</th>
			<th scope="col">服务周期</th>
			<th scope="col">服务次数</th>	
			<th scope="col">开始时间</th>   
			<th scope="col">生成记录</th> 	
      </tr>
      <tr>        
			<th scope="row" id="service">年审</th>
			<th scope="row"  id="registerDate">11/01/2018</th>
			<td>
				<div class="form-group">
					<select class="form-control" id="ServiceCycle" >
							<option>选择服务周期</option>
							<option>1个月</option>
							<option>2个月</option>
							<option>3个月</option>
							<option>4个月</option>												                        
							<option>5个月</option>
							<option>6个月</option>												                        
							<option>7个月</option>
							<option>8个月</option>
							<option>9个月</option>
							<option>10个月</option>												                        
							<option>11个月</option>
							<option selected="selected">12个月</option>												                        
					</select>
				 </div>
              </td>
			  <td>
				 <div class="form-group">
					<select class="form-control" id="serviceTimes">
						<option>选择服务次数</option>
						<option value="1">1</option>
						<option selected="selected">2</option>
						<option>3</option>
						<option>4</option>												                        
						<option>5</option>
						<option>6</option>												                        
						<option>7</option>
						<option>8</option>												                        
						<option>9</option>
						<option>10</option>		
						<option>11</option>
						<option>12</option>													                        											                        
					</select>
				</div>
             </td>                   												  
			 <td>                    
				<div class="form-group">
					<input type="date" class="form-control" id="startDate" placeholder="11/01/2019" >
				</div>
			 </td>
			 <td>  
			     
				 <div class="badge badge-danger"><div style="cursor:pointer" id="addEmpButton">生成记录</div></div>
             </td>
		</tr>	
        <tr>
                <td colspan="6" align="center" class="addBottom_adminTimeLine">
                </td>
        </tr>		
		<tr>
			
			<th colspan="2" scope="col">预计年审时间</th>	
			<th scope="col">实际年审时间</th>  
			<th scope="col">项目办理结果</th>    
			<th scope="col">其它内容备注</th>   
			<th scope="col">是否删除记录</th>                    				  
		</tr>			
		<tr>
			
			<td colspan="2" >31/10/2019</td>
			<td>
				<div class="form-group">
					<input type="date" class="form-control" id="startDate">
				</div>
			</td>
			<td>										                          
				<div class="form-check">
						<input class="form-check-input" type="checkbox" id="defaultCheck1">
								<label class="form-check-label" for="defaultCheck1">
										 已完成
								</label>
				</div>
			</td>
			<td>
				<div class="form-group">
						<input type="text" class="form-control">
				</div>
			</td>													                      
 			<td><a href="javascript:;">删除此记录</a></td>
		</tr>
		<tr>
			
			<td colspan="2" >31/10/2020</td>
			<td>
				<div class="form-group">
					<input type="date" class="form-control">
				</div>
			</td>
			<td>										                          
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="defaultCheck1">
					<label class="form-check-label" for="defaultCheck1">
					已完成
					</label>
				</div>
			</td>
			<td>
				<div class="form-group">
					<input type="text" class="form-control">
				</div>
			</td>													                      
            <td><a href="deleteEmp?id=002">删除此记录</a></td>
			</tr>		
    </table>
    <div>

    </div>            
										                  
										                  
										                  
										                  
										                  
										                    <table class="table table-sm">
										                      <thead>
										                        <tr>
										                          <th scope="col">服务项目</th>
										                          <th scope="col">注册时间</th>
										                          <th scope="col">服务周期</th>
										                          <th scope="col">服务次数</th>	
										  						  <th scope="col">开始时间</th>   
										  						  <th scope="col">生成记录</th> 										  						                        				  
										                        </tr>
										                      </thead>
										                      <tbody>
										                        <tr>
										                          <th scope="row">年审</th>
										                          <th scope="row">11/01/2018</th>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control" id="textInput010">
												                        <option>选择服务周期</option>
												                        <option>1个月</option>
												                        <option>2个月</option>
											                        	<option>3个月</option>
												                        <option>4个月</option>												                        
											                        	<option>5个月</option>
												                        <option>6个月</option>												                        
												                        <option>7个月</option>
												                        <option>8个月</option>
											                        	<option>9个月</option>
												                        <option>10个月</option>												                        
											                        	<option>11个月</option>
												                        <option selected="selected">12个月</option>												                        
												                      </select>
												                    </div>
                   												  </td>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control" id="textInput020">
												                        <option>选择服务次数</option>
												                        <option value="1">1</option>
												                        <option selected="selected">2</option>
												                        <option>3</option>
												                        <option>4</option>												                        
												                        <option>5</option>
												                        <option>6</option>												                        
												                        <option>7</option>
												                        <option>8</option>												                        
												                        <option>9</option>
												                        <option>10</option>		
												                        <option>11</option>
												                        <option>12</option>													                        											                        
												                      </select>
												                    </div>
                   												  </td>                   												  
										                          <td>                    
												                    <div class="form-group">
												                      <input type="date" class="form-control" id="textInput030" placeholder="11/01/2019">
												                    </div>
											                      </td>
										                          <td>  
										                         	 <div class="badge badge-danger"><div style="cursor:pointer" onclick="addTimeLineRecord()" id="">生成记录</div></div>
										                         	 <div class="badge badge-danger"><div style="cursor:pointer" onclick="timeLineRecord(1)" id="textInput040" >查看记录</div></div>                      
                      											  </td>
										                        </tr>										                       										                        
										                    </table>	
			                  
										                    <div  class="timeLineRecordText" >
											                    <table class="table table-sm">
											                      <thead>
											                        <tr>
											                          <th scope="col">项目</th>
											                          <th scope="col">预计年审时间</th>	
											  						  <th scope="col">实际年审时间</th>  
											  						  <th scope="col">项目办理结果</th>    
											  						  <th scope="col">其它内容备注</th>   
											  						  <th scope="col">是否删除记录</th>                    				  
											                        </tr>
											                      </thead>
											                      <tbody id="timeLineRecord1">
											                      	<!-- <tr>
											                          <th scope="row">年审</th>
											                          <td>31/10/2019</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control" >
													                    </div>
											                          </td>
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>
											                        <tr>
														                          <th scope="row">年审</th>
														                          <td>31/10/2020</td>
														                          <td>
																                    <div class="form-group">
																                      <input type="date" class="form-control">
																                    </div>
														                          </td>
														                          <td>										                          
															                          <div class="form-check">
																                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
																                        <label class="form-check-label" for="defaultCheck1">
																                      			  已完成
																                        </label>
																                      </div>
															                      </td>
														                          <td>
														                               <div class="form-group">
																	                      <input type="text" class="form-control">
																	                    </div>
														                          </td>													                      
														                          <td>										                          
															                          <div class="form-check">
																                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
																                        <label class="form-check-label" for="defaultCheck2">
																                      			  删除此记录
																                        </label>
																                      </div>
															                      </td>	
														                        </tr>-->
											                        </tbody>
											                    </table>
															</div>
															
										                    <table class="table table-sm">
										                      <tbody>
										                        <tr>
										                          <th scope="row">财务年度</th>
										                          <th scope="row">11/01/2018</th>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control" id="textInput050">
												                        <option>选择服务周期</option>
												                        <option>年</option>
												                        <option>月</option>
												                      </select>
												                    </div>
                   												  </td>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control"  id="textInput060">
												                        <option>选择服务次数</option>
												                        <option>1</option>
												                        <option>2</option>
												                        <option>3</option>
												                        <option>4</option>												                        
												                        <option>5</option>
												                        <option>6</option>												                        
												                        <option>7</option>
												                        <option>8</option>												                        
												                        <option>9</option>
												                        <option>10</option>													                        
												                      </select>
												                    </div>
                   												  </td>                   												  
										                          <td>                    
												                    <div class="form-group">
												                      <input type="date" class="form-control"  id="textInput070">
												                    </div>
											                      </td>
										                          <td>  
										                         	 <div class="badge badge-danger"><div style="cursor:pointer" onclick="timeLineRecord(2)"  id="textInput080">生成时间记录</div></div>                    
                      											  </td>
										                        </tr>
										                    </table>										                  
										                    <div id="timeLineRecord2" class="timeLineRecordText" style="display:none;">
											                    <table class="table table-sm">
											                      <thead>
											                        <tr>
											                          <th scope="col">项目</th>
											                          <th scope="col">预计年审时间</th>	
											  						  <th scope="col">实际年审时间</th>  
											  						  <th scope="col">项目办理结果</th>    
											  						  <th scope="col">其它内容备注</th>   
											  						  <th scope="col">是否删除记录</th>                    				  
											                        </tr>
											                      </thead>
											                      <tbody>
											                      	<tr>
											                          <th scope="row">财务年度</th>
											                          <td>2019/10/31</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>
											                      	<tr>
											                          <th scope="row">财务年度</th>
											                          <td>2020/10/31</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>
											                    </table>
															</div>															
															

										                    <table class="table table-sm">
										                      <tbody>
										                        <tr>
										                          <th scope="row">ECI申报</th>
										                          <th scope="row">2018/01/11</th>
										                          <td>
										                          	<div class="form-group" >
												                      <select class="form-control" id="textInput090">
												                        <option>选择服务周期</option>
												                        <option>年</option>
												                        <option>月</option>
												                      </select>
												                    </div>
                   												  </td>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control" id="textInput100">
												                        <option>选择服务次数</option>
												                        <option>1</option>
												                        <option>2</option>
												                        <option>3</option>
												                        <option>4</option>												                        
												                        <option>5</option>
												                        <option>6</option>												                        
												                        <option>7</option>
												                        <option>8</option>												                        
												                        <option>9</option>
												                        <option>10</option>													                        
												                      </select>
												                    </div>
                   												  </td>                   												  
										                          <td>                    
												                    <div class="form-group">
												                      <input type="date" class="form-control" id="textInput110">
												                    </div>
											                      </td>
										                          <td>  
										                         	 <div class="badge badge-danger"><div style="cursor:pointer" onclick="timeLineRecord(3)" id="textInput120">生成时间记录</div></div>                    
                      											  </td>
										                        </tr>
										                    </table>										                  
										                    <div id="timeLineRecord3" class="timeLineRecordText" style="display:none;">
											                    <table class="table table-sm">
											                      <thead>
											                        <tr>
											                          <th scope="col">项目</th>
											                          <th scope="col">财务年度时间</th>	
											                          <th scope="col">预计ECI时间</th>	
											  						  <th scope="col">实际ECI时间</th>  
											  						  <th scope="col">项目办理结果</th>    
											  						  <th scope="col">其它内容备注</th>   
											  						  <th scope="col">是否删除记录</th>                    				  
											                        </tr>
											                      </thead>
											                      <tbody>
											                      	<tr>
											                          <th scope="row">ECI申报</th>
											                          <td>2019/10/31</td>
											                          <td>2020/01/31</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>
											                      	<tr>
											                          <th scope="row">ECI申报</th>
											                          <td>2020/10/31</td>
											                          <td>2021/01/31</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>
											                    </table>
															</div>															
											
															

										                    <table class="table table-sm">
										                      <tbody>
										                        <tr>
										                          <th scope="row">报消费税</th>
										                          <th scope="row">2018/01/11</th>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control"  id="textInput130">
												                        <option>选择服务周期</option>
												                        <option>年</option>
												                        <option>月</option>
												                      </select>
												                    </div>
                   												  </td>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control"  id="textInput140">
												                        <option>选择服务次数</option>
												                        <option>1</option>
												                        <option>2</option>
												                        <option>3</option>
												                        <option>4</option>												                        
												                        <option>5</option>
												                        <option>6</option>												                        
												                        <option>7</option>
												                        <option>8</option>												                        
												                        <option>9</option>
												                        <option>10</option>													                        
												                      </select>
												                    </div>
                   												  </td>                   												  
										                          <td>                    
												                    <div class="form-group">
												                      <input type="date" class="form-control"  id="textInput150">
												                    </div>
											                      </td>
										                          <td>  
										                         	 <div class="badge badge-danger"><div style="cursor:pointer" onclick="timeLineRecord(4)"  id="textInput160">生成时间记录</div></div>                    
                      											  </td>
										                        </tr>
										                    </table>										                  
										                    <div id="timeLineRecord4" class="timeLineRecordText" style="display:none;">
											                    <table class="table table-sm">
											                      <thead>
											                        <tr>
											                          <th scope="col">项目</th>
											                          <th scope="col">预计申报时间</th>	
											  						  <th scope="col">实际申报时间</th>  
											  						  <th scope="col">项目办理结果</th>    
											  						  <th scope="col">其它内容备注</th>   
											  						  <th scope="col">是否删除记录</th>                    				  
											                        </tr>
											                      </thead>
											                      <tbody>
											                      	<tr>
											                          <th scope="row">消费税</th>
											                          <td>2021/01/01</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>
											                      	<tr>
											                          <th scope="row">消费税</th>
											                           <td>2021/04/01</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>											                           
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>
											                      	<tr>
											                          <th scope="row">消费税</th>
											                           <td>2021/07/01</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>											                           
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>											                        
											                    </table>
															</div>															
											

										                    <table class="table table-sm">
										                      <tbody>
										                        <tr>
										                          <th scope="row">所得税报税</th>
										                          <th scope="row">2018/01/11</th>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control"  id="textInput170">
												                        <option>选择服务周期</option>
												                        <option>年</option>
												                        <option>月</option>
												                      </select>
												                    </div>
                   												  </td>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control"  id="textInput180">
												                        <option>选择服务次数</option>
												                        <option>1</option>
												                        <option>2</option>
												                        <option>3</option>
												                        <option>4</option>												                        
												                        <option>5</option>
												                        <option>6</option>												                        
												                        <option>7</option>
												                        <option>8</option>												                        
												                        <option>9</option>
												                        <option>10</option>													                        
												                      </select>
												                    </div>
                   												  </td>                   												  
										                          <td>                    
												                    <div class="form-group">
												                      <input type="date" class="form-control"  id="textInput190">
												                    </div>
											                      </td>
										                          <td>  
										                         	 <div class="badge badge-danger"><div style="cursor:pointer" onclick="timeLineRecord(5)"  id="textInput200">生成时间记录</div></div>                    
                      											  </td>
										                        </tr>
										                    </table>										                  
										                    <div id="timeLineRecord5" class="timeLineRecordText" style="display:none;">
											                    <table class="table table-sm">
											                      <thead>
											                        <tr>
											                          <th scope="col">项目</th>
											                          <th scope="col">预计申报时间</th>	
											  						  <th scope="col">实际申报时间</th>  
											  						  <th scope="col">项目办理结果</th>    
											  						  <th scope="col">其它内容备注</th>   
											  						  <th scope="col">是否删除记录</th>                    				  
											                        </tr>
											                      </thead>
											                      <tbody>
											                      	<tr>
											                          <th scope="row">所得税报税</th>
											                          <td>2019/12/15</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>
											                      	<tr>
											                          <th scope="row">所得税报税</th>
											                           <td>2020/12/15</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>											                           
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>										                        
											                    </table>
															</div>															
											


										                    <table class="table table-sm">
										                      <tbody>
										                        <tr>
										                          <th scope="row">所得锐缴税</th>
										                          <th scope="row">2018/01/11</th>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control"  id="textInput210">
												                        <option>选择服务周期</option>
												                        <option>年</option>
												                        <option>月</option>
												                      </select>
												                    </div>
                   												  </td>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control"  id="textInput220">
												                        <option>选择服务次数</option>
												                        <option>1</option>
												                        <option>2</option>
												                        <option>3</option>
												                        <option>4</option>												                        
												                        <option>5</option>
												                        <option>6</option>												                        
												                        <option>7</option>
												                        <option>8</option>												                        
												                        <option>9</option>
												                        <option>10</option>													                        
												                      </select>
												                    </div>
                   												  </td>                   												  
										                          <td>                    
												                    <div class="form-group">
												                      <input type="date" class="form-control"  id="textInput230">
												                    </div>
											                      </td>
										                          <td>  
										                         	 <div class="badge badge-danger"><div style="cursor:pointer" onclick="timeLineRecord(6)"  id="textInput240">生成时间记录</div></div>                    
                      											  </td>
										                        </tr>
										                    </table>										                  
										                    <div id="timeLineRecord6" class="timeLineRecordText" style="display:none;">
											                    <table class="table table-sm">
											                      <thead>
											                        <tr>
											                          <th scope="col">项目</th>
											                          <th scope="col">所得税报税时间</th>	
											                          <th scope="col">预计缴税时间</th>	
											  						  <th scope="col">实际缴税时间</th>  
											  						  <th scope="col">项目办理结果</th>    
											  						  <th scope="col">其它内容备注</th>   
											  						  <th scope="col">是否删除记录</th>                    				  
											                        </tr>
											                      </thead>
											                      <tbody>
											                      	<tr>
											                          <th scope="row">所得锐缴税</th>
 																	  <td>2019/12/15</td>
											                          <td>2020/2/15</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>
											                      	<tr>
											                          <th scope="row">所得锐缴税</th>
 																	  <td>2020/12/15</td>
											                          <td>2021/2/15</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>											                           
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>										                        
											                    </table>
															</div>																										
															

										                    <table class="table table-sm">
										                      <tbody>
										                        <tr>
										                          <th>                    
												                    <div class="form-group">
												                      <input type="text" class="form-control"  id="textInput250">
												                    </div>
											                      </th>										                        
										                          <td>                    
												                    <div class="form-group">
												                      <input type="date" class="form-control"  id="textInput260">
												                    </div>
											                      </td>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control"  id="textInput270">
												                        <option>周期</option>
												                        <option>年</option>
												                        <option>月</option>
												                      </select>
												                    </div>
                   												  </td>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control"  id="textInput280">
												                        <option>次数</option>
												                        <option>1</option>
												                        <option>2</option>
												                        <option>3</option>
												                        <option>4</option>												                        
												                        <option>5</option>
												                        <option>6</option>												                        
												                        <option>7</option>
												                        <option>8</option>												                        
												                        <option>9</option>
												                        <option>10</option>													                        
												                      </select>
												                    </div>
                   												  </td>                   												  
										                          <td>                    
												                    <div class="form-group">
												                      <input type="date" class="form-control"  id="textInput290">
												                    </div>
											                      </td>
										                          <td>  
										                         	 <div class="badge badge-danger"><div style="cursor:pointer" onclick="timeLineRecord(7)"  id="textInput300">生成时间记录</div></div>                    
                      											  </td>
										                        </tr>
										                    </table>										                  
										                    <div id="timeLineRecord7" class="timeLineRecordText" style="display:none;">
											                    <table class="table table-sm">
											                      <thead>
											                        <tr>
											                          <th scope="col">项目</th>
											                          <th scope="col">预计时间</th>	
											  						  <th scope="col">实际时间</th>  
											  						  <th scope="col">项目办理结果</th>    
											  						  <th scope="col">其它内容备注</th>   
											  						  <th scope="col">是否删除记录</th>                    				  
											                        </tr>
											                      </thead>
											                      <tbody>
											                      	<tr>
											                          <th scope="row">data</th>
 																	  <td>data</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>
											                      	<tr>
											                          <th scope="row">data</th>
 																	  <td>data</td>
											                          <td>
													                    <div class="form-group">
													                      <input type="date" class="form-control">
													                    </div>
											                          </td>											                           
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
													                        <label class="form-check-label" for="defaultCheck1">
													                      			  已完成
													                        </label>
													                      </div>
												                      </td>
											                          <td>
											                               <div class="form-group">
														                      <input type="text" class="form-control">
														                    </div>
											                          </td>													                      
											                          <td>										                          
												                          <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="defaultCheck2">
													                        <label class="form-check-label" for="defaultCheck2">
													                      			  删除此记录
													                        </label>
													                      </div>
												                      </td>	
											                        </tr>										                        
											                    </table>
															</div>		
															
															
																														
										                   <!--  <table class="table table-sm">
										                      <thead>
										                        <tr>
										                          <th scope="col">项目</th>
										                          <th scope="col">预计时间</th>
										                          <th scope="col">实际时间</th>	
										  						  <th scope="col">备注</th>                         				  
										                        </tr>
										                      </thead>
										                      <tbody>
										                        <tr>
										                          <th scope="row">注册时间</th>
										                          <td>11/1/2018</td>
										                          <td></td>
										                          <td>                      
                      											</td>
										                        </tr>
										                        <tr>
										                          <th scope="row">年审时间</th>
										                          <td>10/31/2019</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="请填入实际时间"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>
										                        <tr>
										                          <th scope="row">财务年度时间</th>
										                          <td>10/31/2019</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="请填入实际时间"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>
										                        <tr>
										                          <th scope="row">ECI</th>
										                          <td>财务年度后3个月一次性</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="ECI"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>
										                        <tr>
										                          <th scope="row">消费税</th>
										                          <td>3个月一次</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="请填入开始时间"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>
										                        <tr>
										                          <th scope="row">所得税报税</th>
										                          <td>每一年的12月15日之前完成</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="请填入实际时间"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>										                        
										                        <tr>
										                          <th scope="row">所得锐缴税</th>
										                          <td>所得税报税完成后，1-2个月上网缴税，通知客户去操作</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="请填入实际时间"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>										                        				                        									                        
										                      </tbody>
										                    </table> -->
										                    
															<div class="row  adminTimeLine">
														            <div class="col-12 col-md-12 col-lg-12 divCss">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="infoCheckbox0"  onclick="confirmInfo(0)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="textInput000"  class="btnMenu view" href="#" >增加服务项</a>		
																		</div>
																	</div>																									
															</div>											                    
										                    
										                    
										                    
											                <!-- <div class="buttons">
										                      <a href="#" class="btn btn-icon icon-left btn-success"><i class="fas fa-check"></i>确认</a>                      
															  <a href="#" class="btn btn-icon icon-left btn-primary"><i class="far fa-edit"></i>修改</a>
															  <a href="#" class="btn btn-icon icon-left btn-info"><i class="far fa-file"></i>增加服务项</a>
										                    </div>	-->
										                    
				                 
														</div>
										                </div>
														<div class="card" >
										                  <div class="card-body">					                
																<div class="row">	
																	<div class="col-12 col-md-12 col-lg-12">	                    
													                    <div class="form-group">
													                      <label>服务进展</label>
													                      <textarea class="form-control" id="textInput011"></textarea>
													                    </div>
																		<div class="row  adminTimeLine">
																	            <div class="col-12 col-md-12 col-lg-12 divCss">	
																		            <div class="form-check">
																                        <input class="form-check-input" type="checkbox" id="infoCheckbox1"  onclick="confirmInfo(1)">
																                        <label class="form-check-label" for="gridCheck">
																                       		 确认锁定
																                        </label>
																                    </div>	
																                    <div class="inline">														            	
																		            	<span></span><a id="textInput001"  class="btnMenu view" href="#" ></a>		
																					</div>																                    														            	
																				</div>																									
																		</div>														                    												                    
													                    <!--  <div class="buttons">
													                      <a href="#" class="btn btn-icon icon-left btn-success"><i class="fas fa-check"></i>确认</a>                      
																		  <a href="#" class="btn btn-icon icon-left btn-primary"><i class="far fa-edit"></i>修改</a>
													                    </div>	-->
												                    </div>												                    
									                    										                    										                    
																 </div>											                
									                        </div>
							                      		</div>	
														<div class="card">
										                  <div class="card-body">					                
																<div class="row">	
																	<div class="col-12 col-md-12 col-lg-12">	                    
													                    <div class="form-group">
													                      <label>渠道方</label>
													                      <textarea class="form-control"  id="textInput012"></textarea>
													                    </div>
																		<div class="row  adminTimeLine">
																	            <div class="col-12 col-md-12 col-lg-12 divCss">	
																		            <div class="form-check">
																                        <input class="form-check-input" type="checkbox" id="infoCheckbox2"  onclick="confirmInfo(2)">
																                        <label class="form-check-label" for="gridCheck">
																                       		 确认锁定
																                        </label>
																                    </div>
																                    <div class="inline">														            	
																		            	<span></span><a id="textInput002"  class="btnMenu view" href="#" ></a>		
																					</div>																	                    															            	
																				</div>																									
																		</div>														                    												                    
													                    <!--  <div class="buttons">
													                      <a href="#" class="btn btn-icon icon-left btn-success"><i class="fas fa-check"></i>确认</a>                      
																		  <a href="#" class="btn btn-icon icon-left btn-primary"><i class="far fa-edit"></i>修改</a>
													                    </div>	-->
												                    </div>												                    
									                    										                    										                    
																 </div>											                
									                        </div>
							                      		</div>							                      											                
								                        </div>
						                      		</div>
						                    	</div>
						                 	 </div>
						                </div>
						            </div>			  		
                                </div> 
       			</div>
               </div>
           </div>	        
        </section>
      </div>
      <footer class="main-footer">
        <div class="footer-left">
                      版权所有 &copy; 2020 <div class="bullet"></div> 设计是由 <a href="#">睿信集团</a>
        </div>
        <div class="footer-right">
          1.1.0
        </div>
      </footer>

  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../assets/js/stisla.js"></script>


  <!-- Template JS File -->
  <script src="../../../assets/js/scripts.js"></script>
  <script src="../../../assets/js/custom.js"></script>
  <script  src="../../../assets/js/multiplepage.js"></script>
  <!-- Page Specific JS File -->
   <script  src="../../../assets/js/adminTimeLine.js"></script> 

</body>
</html>