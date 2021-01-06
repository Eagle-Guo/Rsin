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
										                          <th scope="row">2018/01/11</th>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control" id="textInput010">
												                        <option>选择服务周期</option>
												                        <option>年</option>
												                        <option>月</option>
												                      </select>
												                    </div>
                   												  </td>
										                          <td>
										                          	<div class="form-group">
												                      <select class="form-control" id="textInput020">
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
												                      <input type="date" class="form-control" id="textInput030">
												                    </div>
											                      </td>
										                          <td>  
										                         	 <div class="badge badge-danger"><div style="cursor:pointer" onclick="timeLineRecord(1)" id="textInput040">生成时间记录</div></div>                    
                      											  </td>
										                        </tr>
										                    </table>										                  
										                    <div id="timeLineRecord1" class="timeLineRecordText" style="display:none;">
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
											                          <th scope="row">年审</th>
											                          <td>2019/10/31</td>
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
										                          <th scope="row">财务年度</th>
										                          <th scope="row">2018/01/11</th>
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
  <script>

  function timeLineRecord(x) {
	  var text = document.getElementById("timeLineRecord"+x);
	  if (text.style.display === "none") {
		  text.style.display = "block";
	  } else {
		  text.style.display = "none";
	  }
	}

  function confirmInfo(x) {
		var checkBox = document.getElementById("infoCheckbox"+x);
		var text0 = document.getElementById("textInput00"+x);	
		var text1 = document.getElementById("textInput01"+x);
		var text2 = document.getElementById("textInput02"+x);
		var text3 = document.getElementById("textInput03"+x);
		var text4 = document.getElementById("textInput04"+x);
		var text5 = document.getElementById("textInput05"+x);	
		var text6 = document.getElementById("textInput06"+x);
		var text7 = document.getElementById("textInput07"+x);
		var text8 = document.getElementById("textInput08"+x);
		var text9 = document.getElementById("textInput09"+x);
		var text10 = document.getElementById("textInput10"+x);		
		var text11 = document.getElementById("textInput11"+x);
		var text12 = document.getElementById("textInput12"+x);	
		var text13 = document.getElementById("textInput13"+x);	
		var text14 = document.getElementById("textInput14"+x);
		var text15 = document.getElementById("textInput15"+x);
		var text16 = document.getElementById("textInput16"+x);
		var text17 = document.getElementById("textInput17"+x);
		var text18 = document.getElementById("textInput18"+x);	
		var text19 = document.getElementById("textInput19"+x);
		var text20 = document.getElementById("textInput20"+x);
		var text21 = document.getElementById("textInput21"+x);
		var text22 = document.getElementById("textInput22"+x);
		var text23 = document.getElementById("textInput23"+x);		
		var text24 = document.getElementById("textInput24"+x);
		var text25 = document.getElementById("textInput25"+x);	
		var text26 = document.getElementById("textInput26"+x);
		var text27 = document.getElementById("textInput27"+x);
		var text28 = document.getElementById("textInput28"+x);		
		var text29 = document.getElementById("textInput29"+x);
		var text30 = document.getElementById("textInput30"+x);						
		if (checkBox.checked == true){
			text0.style.pointerEvents="none";	
			text0.style.color = "gray"; 
			text1.style.pointerEvents="none";
			text1.style.borderColor="white";		
			text2.style.pointerEvents="none";
			text2.style.borderColor="white";				
			text3.style.pointerEvents="none";
			text3.style.borderColor="white";			
			text4.style.pointerEvents="none";
			text4.style.borderColor="white";				
			text5.style.pointerEvents="none";
			text5.style.borderColor="white";			
			text6.style.pointerEvents="none";	
			text6.style.borderColor="white";			
			text7.style.pointerEvents="none";	
			text7.style.borderColor="white";			
			text8.style.pointerEvents="none";	
			text8.style.borderColor="white";			
			text9.style.pointerEvents="none";
			text9.style.borderColor="white";			
			text10.style.pointerEvents="none";	
			text10.style.borderColor="white";			
			text11.style.pointerEvents="none";
			text11.style.borderColor="white";			
			text12.style.pointerEvents="none";	
			text12.style.borderColor="white";		
			text13.style.pointerEvents="none";	
			text13.style.borderColor="white";
			text14.style.pointerEvents="none";	
			text14.style.borderColor="white";
			text15.style.pointerEvents="none";	
			text15.style.borderColor="white";
			text16.style.pointerEvents="none";	
			text16.style.borderColor="white";
			text17.style.pointerEvents="none";	
			text17.style.borderColor="white";
			text18.style.pointerEvents="none";	
			text18.style.borderColor="white";
			text19.style.pointerEvents="none";	
			text19.style.borderColor="white";
			text20.style.pointerEvents="none";	
			text20.style.borderColor="white";
			text21.style.pointerEvents="none";	
			text21.style.borderColor="white";
			text22.style.pointerEvents="none";	
			text22.style.borderColor="white";
			text23.style.pointerEvents="none";	
			text23.style.borderColor="white";
			text24.style.pointerEvents="none";	
			text24.style.borderColor="white";
			text25.style.pointerEvents="none";	
			text25.style.borderColor="white";
			text26.style.pointerEvents="none";	
			text26.style.borderColor="white";
			text27.style.pointerEvents="none";	
			text27.style.borderColor="white";
			text28.style.pointerEvents="none";	
			text28.style.borderColor="white";
			text29.style.pointerEvents="none";	
			text29.style.borderColor="white";
			text30.style.pointerEvents="none";	
			text30.style.borderColor="white";								
		} else {
			text0.style.pointerEvents="unset";	
			text0.style.color = "#6777ef"; 
			text1.style.pointerEvents="unset";
			text1.style.borderColor="#e4e6fc";		
			text2.style.pointerEvents="unset";	
			text2.style.borderColor="#e4e6fc";			
			text3.style.pointerEvents="unset";	
			text3.style.borderColor="#e4e6fc";			
			text4.style.pointerEvents="unset";	
			text4.style.borderColor="#e4e6fc";			
			text5.style.pointerEvents="unset";	
			text5.style.borderColor="#e4e6fc";			
			text6.style.pointerEvents="unset";	
			text6.style.borderColor="#e4e6fc";			
			text7.style.pointerEvents="unset";	
			text7.style.borderColor="#e4e6fc";			
			text8.style.pointerEvents="unset";	
			text8.style.borderColor="#e4e6fc";			
			text9.style.pointerEvents="unset";	
			text9.style.borderColor="#e4e6fc";			
			text10.style.pointerEvents="unset";	
			text10.style.borderColor="#e4e6fc";			
			text11.style.pointerEvents="unset";	
			text11.style.borderColor="#e4e6fc";			
			text12.style.pointerEvents="unset";	 	
			text12.style.borderColor="#e4e6fc";	
			text13.style.pointerEvents="unset";	
			text13.style.borderColor="#e4e6fc";			
			text14.style.pointerEvents="unset";	 	
			text14.style.borderColor="#e4e6fc";	
			text15.style.pointerEvents="unset";	
			text15.style.borderColor="#e4e6fc";			
			text16.style.pointerEvents="unset";	 	
			text16.style.borderColor="#e4e6fc";	
			text17.style.pointerEvents="unset";	
			text17.style.borderColor="#e4e6fc";			
			text18.style.pointerEvents="unset";	 	
			text18.style.borderColor="#e4e6fc";	
			text19.style.pointerEvents="unset";	
			text19.style.borderColor="#e4e6fc";			
			text20.style.pointerEvents="unset";	 	
			text20.style.borderColor="#e4e6fc";		
			text21.style.pointerEvents="unset";	 	
			text21.style.borderColor="#e4e6fc";	
			text22.style.pointerEvents="unset";	 	
			text22.style.borderColor="#e4e6fc";	
			text23.style.pointerEvents="unset";	 	
			text23.style.borderColor="#e4e6fc";	
			text24.style.pointerEvents="unset";	 	
			text24.style.borderColor="#e4e6fc";	
			text25.style.pointerEvents="unset";	 	
			text25.style.borderColor="#e4e6fc";	
			text26.style.pointerEvents="unset";	 	
			text26.style.borderColor="#e4e6fc";	
			text27.style.pointerEvents="unset";	 	
			text27.style.borderColor="#e4e6fc";	
			text28.style.pointerEvents="unset";	 	
			text28.style.borderColor="#e4e6fc";	
			text29.style.pointerEvents="unset";	 	
			text29.style.borderColor="#e4e6fc";	
			text30.style.pointerEvents="unset";	 	
			text30.style.borderColor="#e4e6fc";							
		}
	}		

  
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</body>
</html>