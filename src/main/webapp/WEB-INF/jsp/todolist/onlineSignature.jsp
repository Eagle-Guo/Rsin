<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>睿信集团&mdash; 控制面版</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" >
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="../../../assets/css/style.css">
  <link rel="stylesheet" href="../../../assets/css/components.css">
  <link rel="stylesheet" href="../../../assets/css/multiplepage.css">
  <link rel="stylesheet" href="../../../assets/css/jquery-ui.css">

  
  
</head>

<body>
<jsp:include page="../userMenu.jsp" />
      <!-- Main Content -->
      <div class="main-content">  
        <section class="section" id="onlineSignature">
	        <div class="section-header">
	           <h1>在线签名</h1>
	        </div>  
				<div class="" style="overflow: auto;">
					<!--content inner-->
					<div class="content__inner">
						<div class="container overflow-hidden">
							<div class="multisteps-form">
								<!--progress bar-->
								<div class="row">
									<div class="col-12 col-lg-8 ml-auto mr-auto mb-4">
										<div class="multisteps-form__progress">
											<button class="multisteps-form__progress-btn   js-active " type="button" title="选择服务">选择服务</button>
											<button class="multisteps-form__progress-btn    js-active " type="button" title="信息填报">信息填报</button>
											<button class="multisteps-form__progress-btn    js-active " type="button" title="在线支付">在线支付</button>
											<button class="multisteps-form__progress-btn  js-active" type="button" title="电子签名" >电子签名</button>
											<button class="multisteps-form__progress-btn" type="button" title="上传资料"  onclick="top.location='uploadPage'">上传资料</button>
											<button class="multisteps-form__progress-btn disable-button" type="button" title="注册受理中">注册受理中</button>
											<button class="multisteps-form__progress-btn disable-button" type="button" title="注册完成、查看文件">注册完成</button>																					
										</div>
									</div> 
							  </div>
						 </div> 
					   </div>									
					</div> 
				</div>									
																		        
		    <div class="container sectionPadding sevice">
		        <div class="card">            
		            <div class="card-body">
		                <div class="row">
		                    <div class="tab">
		                        <button class="tablinks active" onmouseover="openTab(event, 'ESignature')">电子签名</button>
		                        <button class="tablinks" onmouseover="openTab(event, 'Signature')">线下签名</button>                                                
		                    </div>
						    <div id="ESignature" class="tabcontent" style="display:block;padding: 0px; width: 100%;">
				            <div class="col-12 col-md-12 col-lg-12 menuBotom" id="readyContent">
				                <div class="card removeBorder">
				                	<div class="card-body"  style="display:block;padding: 0px;">
				                    	<div id="accordion">
				                      		<div class="accordion">
						                        <div class="accordion-header collapsible1" role="button" data-toggle="collapse" data-target="#panel-body-1" aria-expanded="true">
						                         	<h4>${companyName}-待签名清单</h4>
						                        </div>
						                        <div class="accordion-body collapse show" id="panel-body-1" data-parent="#accordion">
						          <div class="row"> 				          
						            <div class="col-lg-4 col-md-12 col-12 col-sm-12 card">
						              <div class=""> <div class="card-header"> <h4>待签名文件清单</h4> </div> </div>
						              <div class="card-body fixcardhieht">
						                  <ul class="list-unstyled list-unstyled-border">

						                  	<c:if test="${isDirector || isNamedDirector}">
							                    <li class="media leftTab active"  id="b-1" onclick="viewPri(1)" onmouseover="viewPri(1)" >
							                      <div class="media-body">
							                        <!--<div class="float-right list_btn" id="downloadDoc1">下载</div>  -->
													<div class="">First Director Meeting Resolution</div>   
								                    <div class="checkbox">
													    <label>
													      <input type="checkbox" class="compulsory_read">  已阅读
													    </label>
													 </div>				                                            
							                      </div>
							                    </li>
						                    </c:if>

											<c:if test="${isShareholder}">
							                    <li class="media leftTab active"  id="b-2" onclick="viewPri(2)" onmouseover="viewPri(2)" >
							                      <div class="media-body">
							                        <!--<div class="float-right list_btn" id="downloadDoc2">下载</div>-->
							                        <div class="">Secretary Agreement </div> 
								                    <div class="checkbox">
													    <label>
													      <input type="checkbox" class="compulsory_read">  已阅读
													    </label>
													 </div>						                                              
							                      </div>
							                    </li>
						                    </c:if>
						                    
						                    <c:if test="${isShareholder}">
							                    <li class="media leftTab active"  id="b-3" onclick="viewPri(3)" onmouseover="viewPri(3)" >
							                      <div class="media-body">
							                        <!--<div class="float-right list_btn" id="downloadDoc3">下载</div>-->
							                        <div class="">ANNEX B - Notice for Controllers</div>    
								                    <div class="checkbox">
													    <label>
													      <input type="checkbox" class="compulsory_read">  已阅读并回复文中问题
													    </label>
													 </div>						                                           
							                      </div>
							                    </li>   
						                    </c:if>
						                    
						                    <c:if test="${isShareholder}">
							                    <li class="media leftTab active"  id="b-4" onclick="viewPri(4)" onmouseover="viewPri(4)" >
							                      <div class="media-body">
							                        <!--<div class="float-right list_btn" id="downloadDoc4">下载</div>-->
							                        <div class="">Application of Shares</div>  
								                    <div class="checkbox">
													    <label>
													      <input type="checkbox" class="compulsory_read">  已阅读
													    </label>
													 </div>						                                             
							                      </div>
							                    </li>
						                    </c:if>
						                    
						                    <c:if test="${isDirector || isShareholder}">
							                    <li class="media leftTab active"  id="b-5" onclick="viewPri(5)" onmouseover="viewPri(5)" >
							                      <div class="media-body">
							                        <!--<div class="float-right list_btn" id="downloadDoc5">下载</div>-->
							                        <div class="">Client Acceptance Form</div>     
								                    <div class="checkbox">
													    <label>
													      <input type="checkbox" class="compulsory_read">  已阅读并回复文中问题
													    </label>
													 </div>						                                          
							                      </div>
							                    </li>
						                    </c:if>
						                    
						                    <c:if test="${isDirector || isNamedDirector}">
							                    <li class="media leftTab active"  id="b-6" onclick="viewPri(6)" onmouseover="viewPri(6)" >
							                      <div class="media-body">
							                        <!--<div class="float-right list_btn" id="downloadDoc6">下载</div>-->
							                        <div class="">Form 45 / 201</div>    
								                    <div class="checkbox">
													    <label>
													      <input type="checkbox" class="compulsory_read">  已阅读
													    </label>
													 </div>						                                           
							                      </div>
							                    </li>   
						                    </c:if>
						                    
						                    <c:if test="${isShareholder}">
							                    <li class="media leftTab active"  id="b-7" onclick="viewPri(7)" onmouseover="viewPri(7)" >
							                      <div class="media-body">
							                        <!--<div class="float-right list_btn" id="downloadDoc7">下载</div>-->
							                        <div class="">Share Certificate</div>   
								                    <div class="checkbox">
													    <label>
													      <input type="checkbox" class="compulsory_read">  已阅读
													    </label>
													 </div>						                                            
							                      </div>
							                    </li>
						                    </c:if>
						                    
						                    <c:if test="${isDirector && isNamedDirector || isNamedDirector}">
							                    <li class="media leftTab active"  id="b-8" onclick="viewPri(8)" onmouseover="viewPri(8)" >
							                      <div class="media-body">
							                        <!--<div class="float-right list_btn" id="downloadDoc8">下载</div>  -->
							                        <div class="">Nominee's+Dir's+Authrn_Final</div> 
								                    <div class="checkbox">
													    <label>
													      <input type="checkbox" class="compulsory_read">  已阅读
													    </label>
													 </div>						                                              
							                      </div>
							                    </li>                    
						                  	</c:if>

						                  </ul> 
						              </div>
		
						            </div>				           				            
						            <div class="col-lg-8 col-md-12 col-12 col-sm-12 viewFilePart">
						               <div id="editor"></div>
						               <div id="temporary" style="display: none;"></div>				               
						               <div class="card priDesc" id="b8">
						                <div class="card-header">
						                  <h4>文件查看区</h4>
						                </div>
						                <div class="card-body fixcardhieht">
						                     <h4><b>Nominee's+Dir's+Authrn_Final</b></h4><br/>
						                     <div class="media-content">					 
											     <div style="float:left">
													 <p class="text_signfile"><span>THIS AGREEMENT is dated the</span><span> 日期 （自动替换）</span></p>    
													 <p class="text_signfile text_cn">本协议订立于</p>   
												
												 </div>
												 <div class="clear"></div>
												 <br/>
						                    	 <p class="text_signfile text_centre">AGREEMENT FOR APPOINTMENT OF NOMINEE DIRECTOR</p>    
						                    	 <p class="text_signfile text_centre text_cn">委任挂名董事协议</p> 	
												<br/>
						                    	 <p class="text_signfile">Between</p>    
						                    	 <p class="text_signfile">(the “Nominee”)</p>  						 
						                    	 <p class="text_signfile">and</p>    
						                    	 <p class="text_signfile">Company Name</p> 	
												 <br/>
												<p class="text_signfile"><span>(Company Registration No. [              ]), a company incorporated in the Republic of Singapore and having its registered address at [111 North Bridge Road #29-06A Peninsula Plaza Singapore 179098] (“Company”);</span></p>    
												<p class="text_signfile text_cn"><span class="text_cn">[.]私人有限公司（公司注册号：[                        ]），一家于新加坡成立的有限责任公司，注册地址为[北桥路111号，柏龄大厦 29-06A，新加坡 179098]（简称“公司”）。</span></p> 
												<br/>
												<p class="text_signfile"><span>WHEREAS</span></p>    
												<p class="text_signfile text_cn">鉴于</p> 
												<p class="text_signfile"><span>The Company has requested the Nominee to provide the services of a nominee who shall, and the Nominee has agreed to, be appointed as a nominee director of the Company (“Nominee Director”) upon the terms and conditions as stated herein.</span></p>    
												<p class="text_signfile text_cn">依据本协议约定的条款和条件，公司要求提供挂名董事服务（简称“挂名董事”）。</p> 
												<p class="text_signfile"><span>(The above-mentioned parties shall alternatively be referred to individually as “Party”, and collectively as “Parties”.)</span></p>  
												<p class="text_signfile"><span>NOW, THEREFORE, THE PARTIES, HEREBY AGREE AS FOLLOWS:</span></p>    
												<p class="text_signfile text_cn">双方同意如下：</p> 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">A.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>
																PPOINTMENT AND DUTIES OF THE NOMINEE DIRECTOR
															</span><br/>								
															<span class="text_cn">
																委任和责任
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">1.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>
																The Nominee shall provide the Company with the services of the Nominee Director. Upon the notification of the particulars of the Nominee Director, the Company shall take such steps as are necessary for the Nominee Director to be appointed as a nominee director of the Company.
															</span><br/>								
															<span class="text_cn">
																我们将提供公司挂名董事服务。公司被通知挂名董事的个人信息后，应为该挂名董事采取必要的步骤使其委任为公司之董事。
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">2.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>
																The duties of the Nominee Director shall be limited to the signing of statutory forms and board resolutions in order to comply with the requirements of the Companies Act, Cap. 50 and its regulations and the Company’s Constitution. </span><br/>									
															<span class="text_cn">
																挂名董事之责任仅限于签署法定表格和董事会决议，以符合新加坡公司法和其规则及公司章程的要求。
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">3.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>
																For the avoidance of doubt, the Nominee Director shall not be required to participate, in any manner whatsoever, in the management or decision-making of the Company and shall not be required to sign or execute any agreement, assurance, guarantee or other documents which would incur or in any way impose any personal liability on the Nominee Director, whether as a principal or guarantor, notwithstanding that the same is purportedly for the benefit of the Company or any other third party.  The Nominee Director shall also not be required to comply with any instructions which may be unlawful under the laws of Singapore as well as all other laws which may be applicable.	
															</span><br/>								
															<span class="text_cn">
																挂名董事将不会以任何形式参与公司管理层或公司决策，将不会被要求签署或执行任何协议、保证、担保或其他可能产生的文件，或任何会引起该挂名董事个人责任的文件，尽管这些文件据称是为了公司或任何第三方的利益。挂名董事将也不需遵守任何违反新加坡公司法或其他成文法规定的指示。
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">4.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>
																Statement on matters regarding assistance bank account opening:
															</span><br/>								
															<span class="text_cn">
																关于协助银行开户事项声明：
															</span>
														</p> 
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">a)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		In the event of requirement, the Nominee Director will provide assistance pertaining to matters of local bank account opening by providing valid personal identification documents to the bank. The Nominee Director retains the legal right to claim full indemnity, compensation and accountability from the Company should the Company submit the Nominee Director’s personal identification for any other uses beside bank account opening. 
																	</span><br/>								
																	<span class="text_cn">
																		在有需要的情况下，新加坡挂名董事将对于公司在新加坡本地银行开户的服务进行协助，并且提供有效的个人身份证件给予银行进行开户的。一旦发现新加坡挂名董事的身份证件在未告知的情况下用作其他用途，我们和/或者挂名董事将保留法律追究以及要求赔偿的权利。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">b)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Assistance for opening bank account will only be provided by the Nominee Director in the event that the bank in question is a local (Singapore) bank. The Nominee Director reserves the rights to reject the Company’s request (if any) for bank account opening at an overseas bank, except that this does not apply to requests for opening an account at a bank in China. 
																	</span><br/>								
																	<span class="text_cn">
																		新加坡挂名董事协助开户的义务尽止于新加坡本地银行，若公司要求新加坡挂名董事协助外国银行的开户，挂名董事有权提出拒绝。对于要求在中国大陆进行开户的公司，则不在此例。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>									 
						               		 		</div>	               		 						 
												 </div>						 
												<div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">5.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>
																The Nominee Director shall execute the Authorisation substantially in the form and manner as in the Appendix A to this Agreement for authorising the collection, use and disclosure by the Rsin Group Pte Ltd of relevant particulars of the Nominee Director in accordance with the Personal Data Protection Act of the Singapore statutes, for the purposes of submissions to the various government or regulatory bodies, such as, CPF Board, ACRA, IRAS, Ministry of Manpower, Agri-Food and Veterinary Authority of Singapore (AVA) and to the banks, as and when so required; and also for authorising the setting up and use of the CorpPass when required, for and on behalf of the Company.
															</span><br/>								
															<span class="text_cn">
																挂名董事应依照本协议附录A的格式签署授权书，以授权睿信集团，根据《新加坡个人数据保护法》收集、使用和披露挂名董事的相关个人信息，依据要求提交给政府部门和监管机构，如公积金局、新加坡商业及会计局、税务局、人力部、新加坡农粮兽医管理局(AVA)以及银行，并代表公司授权设置和使用CorpPass登录相关系统。
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">B.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>
																TERMINATION
															</span><br/>								
															<span class="text_cn">
																终止
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">1.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Either Party may terminate this Agreement at any time by providing the other Party with prior one (1) month’s notice in writing.
																	</span><br/>								
																	<span class="text_cn">
																		协议双方有权在提供对方提前1个月的书面通知的前提下，在任何时候终止本协议。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>								
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">2.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		In the event of ceasing (for whatever reason) to provide the services of the Nominee Director, the board of directors of the Company shall accept the resignation of the Nominee Director and where required under the Companies Act, Cap. 50 and its regulations or the Company’s Constitution, shall take immediate steps to appoint another person in place of the Nominee Director as a director of the Company on or before the date of termination and/or cessation of the appointment of the Nominee Director.  
																	</span><br/>								
																	<span class="text_cn">
																		若停止提供挂名董事服务（无论何种原因），公司董事会应接受挂名董事之请辞并在终（停）止日前或当天依据新加坡公司法及其规定或公司章程，采取立即的措施委任另一个人为公司董事，来代替该挂名董事。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>									
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">3.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		The Company shall provide with satisfactory documentary evidence that such changes have been effected and notified to the ACRA.
																	</span><br/>								
																	<span class="text_cn">
																		公司提供符合要求的书面文件，证明该替换已经生效并已经通知新加坡商业注册局。</span>
																</p> 
															</div>	               		 						 
														 </div>											
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">C.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>
																WARRANTIES AND COVENANTS
															</span><br/>								
															<span class="text_cn">
																保证和协约
															</span>
														</p>   
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">1.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		The Company hereby undertakes and warrants that all acts required to be done by the Nominee Director shall be lawful under the laws of Singapore as well as all other laws which may be applicable and that all statements and documents, which the Nominee Director is requested to sign, shall be true, accurate and not misleading and for lawful purposes.
																	</span><br/>								
																	<span class="text_cn">
																		公司据此承诺和保证要求挂名董事开展的活动符合新加坡法律和其他适用的法律，所有要求挂名董事签署的声明和文件都是真实、正确且未有任何误导并且出于合法的目的。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>								
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">2.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		The Company hereby undertakes and warrants that the Company will keep proper accounts and will file all income tax returns and all papers and documents which are required by law to be filed with any authority and that all taxes required to be paid by the Company will be duly paid.
																	</span><br/>								
																	<span class="text_cn">
																		公司据此承诺和保证公司将会遵守会计准则，申报公司所得税，向有关机关申报法律要求申报的所有文件，公司所需要支付的税收都将会按时支付。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>									
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">3.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		The Company shall indemnify, hold harmless and/or defend the Nominee Director from and against all liabilities, actions, proceedings, penalties, damages, costs, charges, expenses, fines, claims, demands and/or suits that may be made or imposed against or on the Nominee Director by reason of any act, deed, matter or thing done or omitted to be done by the Nominee Director and/or the Company for whatsoever reason, and pay all of the Nominee Director’s solicitor’s fees on a full indemnity basis in the the Nominee Director take any steps or commences any legal action to enforce his or her rights under this Agreement and/or in law. The Nominee Director shall not be liable in any way whatsoever for any non-fulfillment of the Company’s compliance obligations for any reason whatsoever and howsoever arising.
																	</span><br/>								
																	<span class="text_cn">
																		公司应赔偿并保护挂名董事免受因其或公司的任何行动、行为、事项或遗漏而可能对被挂名董事提出或施加的所有责任、诉讼、法律程序、罚款、损害赔偿、花费、费用、支出、索赔、要求和/或诉讼。如挂名董事采取任何步骤或法律行动以行使本合同项下或依法享有的权利，公司应全额赔偿支付挂名董事的所有律师费。如公司无论出于任何理由或任何原因未能履行其合规义务，挂名董事均不以任何方式承担因此而导致的任何责任。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">4.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		The Company shall be liable for and pay the Nominee Director all disbursements, costs and expenses (including but not limited to expenses, penalties and/or legal fees), which may be incurred by the Nominee Director in connection with and/or arising from this Agreement and/or in discharging his or her duties and responsibilities as the Nominee Director.
																	</span><br/>								
																	<span class="text_cn">
																		公司应承担并支付挂名董事可能因本协议产生和/或与本协议相关，和/或因其履行挂名董事职责而承担的所有支出、成本和费用（包括但不限于支出、罚款和/或法律费用）。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>									 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">D.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>
																GENERAL
															</span><br/>								
															<span class="text_cn">
																综合
															</span> 
														</p>   
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">1.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		If any of the provisions of this Agreement becomes invalid, illegal or unenforceable in any respect under any law, the validity, legality and enforceability of the remaining provisions shall not in any way be affected or impaired.
																	</span><br/>								
																	<span class="text_cn">											
																		若本协议中的任何条款无效，非法或不能执行，并不影响或损害本协议其他条款的有效性、合法性和执行性。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>								
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">2.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		This Agreement embodies the entire understanding of the Parties and there are no promises, terms and conditions or disclosures or obligations, oral or written, express or implied other than those contained herein, save and except those mutually agreed to in writing between the Parties after the due execution of this Agreement and each Party acknowledges that it has not relied on any oral or written representations made to it by the other or its employees or agents.
																	</span><br/>								
																	<span class="text_cn">
																		除双方签署本协议后书面共同同意，且每一方确认其没有依赖任何对方、对方雇员或代理口头或书面的声明外，本协议包含双方的全部理解，除本协议外，双方之间无任何承诺、条款和条件，或披露或义务，无论是口头还是书面，明示或暗示的。	
																	</span>
																</p> 
															</div>	               		 						 
														 </div>									
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">3.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Time wherever mentioned in this Agreement shall be of the essence of this Agreement. 
																	</span><br/>								
																	<span class="text_cn">
																		本协议提到的时间视为协议之要素。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">4.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Subject as otherwise provided herein, all notices, demands or other communications required or permitted to be given or made hereunder shall be in writing and delivered personally or sent by prepaid registered post or certificate of posting or by facsimile message addressed to the intended recipient thereof at its address or its facsimile number set out herein (or to such other address or facsimile number as any Party may from time to time notify the other Party and the Nominee Director for the purpose of this clause) or by other means which Parties may agree in writing thereafter. Any notice, demand or communication shall be deemed to have been duly served:
																	</span><br/>								
																	<span class="text_cn">
																		除另有规定外，所有的通知、请求或者其他要求或允许提供的通信应采用书面形式，由本人亲自递送，或以预付款挂号信或邮寄证明的形式寄送，或以传真至收信人地址或传真号码的形式（或依据不定时通知对方的任何其他地址或传真号码），或双方书面同意的其他方式。任何通知、请求或通信被视为已经投递：
																	</span>
																</p> 
																 <div class="row text_no_di2">
																	<div class="col-md-2 col-sm-2"> 
																		<p class="text_signfile">(a)</p> 
																	</div>		
																	<div class="col-md-10 col-sm-10"> 
																		<p class="text_signfile">
																			<span>
																				if delivered personally, on the day of delivery;
																			</span><br/>								
																			<span class="text_cn">
																				若亲自递送，递送日当日；
																			</span>
																		</p> 
																	</div>	               		 						 
																 </div>											
																 <div class="row text_no_di2">
																	<div class="col-md-2 col-sm-2"> 
																		<p class="text_signfile">(b)</p> 
																	</div>		
																	<div class="col-md-10 col-sm-10"> 
																		<p class="text_signfile">
																			<span>
																				if sent by facsimile, on the day of the conclusion of transmission; 
																			</span><br/>								
																			<span class="text_cn">
																				若传真发送，收到传送回执的当日；
																			</span>
																		</p> 
																	</div>	               		 						 
																 </div>	
																 <div class="row text_no_di2">
																	<div class="col-md-2 col-sm-2"> 
																		<p class="text_signfile">(c)</p> 
																	</div>		
																	<div class="col-md-10 col-sm-10"> 
																		<p class="text_signfile">
																			<span>
																				if sent by letter to a local address, two (2) business days after posting and in proving the same it shall be sufficient to show that the envelope containing the notice, demand or communication was duly addressed, stamped and posted. Such posting shall be preceded by a facsimile of the cover page; and
																			</span><br/>								
																			<span class="text_cn">
																				若邮寄到本地地址，邮寄后2个营业日，为证明此，应出示包含通知、请求或通信的信封已经恰当地写明住址，敲盖邮戳并寄送。信封封面样式应在寄送前传真给对方；
																			</span>
																		</p> 
																	</div>	               		 						 
																 </div>	
																 <div class="row text_no_di2">
																	<div class="col-md-2 col-sm-2"> 
																		<p class="text_signfile">(d)</p> 
																	</div>		
																	<div class="col-md-10 col-sm-10"> 
																		<p class="text_signfile">
																			<span>
																				if sent by letter to an overseas address, seven (7) business days after posting and in proving the same it shall be sufficient to show that the envelope containing the notice, demand or communication was duly addressed, stamped and posted. Such posting shall be preceded by a facsimile of the cover page.
																			</span><br/>								
																			<span class="text_cn">
																				若邮寄到海外地址，邮寄后7个营业日，为证明此，应出示包含通知、请求或通信的信封已经恰当地写明住址，敲盖邮戳并寄送。信封封面样式应在寄送前传真给对方。
																			</span>
																		</p> 
																	</div>	               		 						 
																 </div>											
															</div>	  									
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">5.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		This Agreement shall be binding on each of the Parties and their respective assignees, executors and administrators.
																	</span><br/>								
																	<span class="text_cn">
																		本协议对双方，他们的承继者，制定遗嘱执行人和管理人具有约束力。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">6.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		A person who is not a party to this Agreement has no rights under the Contracts (Rights of Third Parties) Act (Cap. 53B) to enforce any term of this Agreement.
																	</span><br/>								
																	<span class="text_cn">
																		非协议之当事人无权依据合同法（第三方权利）来执行本协议的任何条款。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">7.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Termination of this Agreement for whatever reason shall not release either Party from any obligations which, either expressly or by implication, are intended to survive the termination of this Agreement, nor will it affect the rights and liabilities of the Parties, as at the date of termination.
																	</span><br/>								
																	<span class="text_cn">
																		无论因何种原因终止本协议将不会豁免协议任何一方的义务，无论该义务是明示还是暗示，也无论该义务是协议终止后有意残留的，也不会影响到至终止日止挂名董事的权利和协议双方产生的权利和债务。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>		
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">8.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Words denoting the singular number only shall include the plural number and vice versa.
																	</span><br/>								
																	<span class="text_cn">
																		单数形式将包括复数形式，反之亦然。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">9.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Words denoting the masculine gender only shall include the feminine and neuter genders.
																	</span><br/>								
																	<span class="text_cn">
																		男性人称将包括女性人称和中性人称。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">10.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		10.	References to persons shall be deemed to include bodies incorporated or unincorporated.
																	</span><br/>								
																	<span class="text_cn">
																		人称将视为包括成立或未成立的组织。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">11.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		The Recitals to this Agreement shall be and form an integral part of this Agreement.
																	</span><br/>								
																	<span class="text_cn">
																		协议的前言部分为协议之组成部分。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">12.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Headings in this Agreement are for convenient reference only and shall not be used to construe or interpret this Agreement.
																	</span><br/>								
																	<span class="text_cn">
																		协议之标题只为方便参考之使用，并不是用来分析或演绎协议之用。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">13.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Any reference to a statutory provision shall include such provision and any regulations made in pursuance thereof as from time to time modified or re enacted whether before or after the date of this Agreement.
																	</span><br/>								
																	<span class="text_cn">
																		引用法条将包括该法条和任何依据该条制订的规则，无论是协议订立前或后不时修改或者重新制定。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">14.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		“Dollars" and the sign "$" shall mean the lawful currency of Singapore.
																	</span><br/>								
																	<span class="text_cn">
																		新元或者符号“$”代表新加坡的法定货币。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">15.</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		This Agreement shall be governed by and construed in accordance with the laws of the Republic of Singapore and Parties agree to submit to the non-exclusive jurisdiction of the courts of the Republic of Singapore.
																	</span><br/>								
																	<span class="text_cn">
																		本协议受新加坡法律管辖，新加坡法院对本协议具有非排外管辖权。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>									 
						               		 		</div>	               		 						 
												 </div>
												<p class="text_signfile"><span>IN WITNESS whereof the Parties have duly executed this Agreement as of the date and year written above.</span></p> 
												<p class="text_signfile text_cn"><span>协议双方在上述的年份和日期合法有效地签署本协议。</span></p>
												<br/> 
												<div class="row text_no_di2">
													<div class="col-md-5 col-sm-5"> 						
														<p class="text_signfile">Signed by [name of nominee]</p> 
														<br/>
														<br/>	
														<br/>
														<p class="text_signfile"><span>Name:</span></p> 
														<p class="text_signfile"><span>NRIC No.:</span></p> 
													</div>		
													<div class="col-md-7 col-sm-7"> 
														<p class="text_signfile">Signed for and on behalf[name of Company]</p> 
														<br/>
														<br/>
														<p class="text_signfile"><span>Director:</span></p> 
														<p class="text_signfile text_cn"><span> 董事</span></p>
														<br/>
														<br/>								
														<p class="text_signfile"><span>Secretary:</span></p> 
														<p class="text_signfile text_cn"><span> 公司秘书</span></p>	
													</div>	               		 						 
												</div>	
						               		 </div>
						                </div>			
						              </div>              
						               
						               <div class="card priDesc" id="b7">
						                <div class="card-header">
						                  <h4>文件查看区</h4>
						                </div>
						                <div class="card-body fixcardhieht">
						                     <h4><b>Share Certificate</b></h4><br/>
						                     <div class="media-content">
											     <div style="float:left">
													 <p class="text_signfile"><span>Certificate Number:</span><span></span></p>    
													 <p class="text_signfile text_cn">证书编号</p>   
												 </div>
											     <div style="float:right">
													 <p class="text_signfile"><span>Number of Shares:</span><span></span></p>    
													 <p class="text_signfile text_cn">股份数</p>   
												 </div>	
												 <br/><br/><br/>
						                    	 <p class="text_signfile text_centre">ANNEX B – NOTICE FOR CONTROLLERS</p>    
						                    	 <p class="text_signfile text_cn">${companyName} 私人有限公司</p> 						 
						                    	 <p class="text_signfile text_centre">(Incorporated in the Republic of Singapore under The Companies Act, Cap. 50)</p>    
						                    	 <p class="text_signfile text_cn">根据公司法第50章在新加坡成立</p> 	
												<br/>						 
						                    	 <p class="text_signfile">
													 <span>This is to certify that</span> <span class="text_cn">兹证明</span><span class="underline">SHAREHOLDER’S NAME & NRIC股东的名字与身份证号码(自动替换)</span> 
													 <span>of </span> <span class="underline">SHAREHOLDER’S PERSONAL ADDRESS股东个人居住地址(自动替换)</span> 
													 <span>is the registered owner of </span> <span class="text_cn">是持有以下股份数量的登记股东</span><span class="underline">TWO THOUSAND AND FIVE HUNDRED (自动替换)</span> 
													 <span>Ordinary shares of One Dollar each fully paid in</span> <span class="text_cn">普通股每股一块全额缴清</span><span class="underline">${companyName} PTE. LTD.(自动替换)</span> 
													 <span>subject to the Constitution of the Company</span> <span class="text_cn">根据公司章程</span>
													 <span>Given under the Common Seal of the Company on</span> <span class="text_cn">根据公司章程</span>
													 <span class="underline">the date of registration with ACRA</span> 	<span class="text_cn">在ACRA注册之日加盖公司公章</span>					 						 
												 </p>    						 
												<br/>
												<p class="text_signfile">SIGNATURE OF DIRECTOR</p> 
												<br/>
												<p class="text_signfile"></p> 	
												<p class="text_signfile"><span>Signed By Director:</span>DIRECTOR’S NAME(自动替换)</p> 
												<p class="text_signfile text_cn">董事签字</p> 
												<br/>					
												<p class="text_signfile">SIGNATURE OF SECRETARY</p> 
												<br/>
												<p class="text_signfile"></p> 	
												<p class="text_signfile"><span>Signed By Secretary:</span>SECRETARY’S NAME(自动替换)</p> 
												<p class="text_signfile text_cn">秘书签字</p> 
												<br/>					 						 																							
						               		 </div>
						                </div>				
						              </div>           
						               
						               <div class="card priDesc" id="b6">
						               <div class="card-header">
						                  <h4>文件查看区</h4>
						                </div>
						                <div class="card-body fixcardhieht">
						                     <h4><b>Form 45 / 201</b></h4><br/>
						                     <div class="media-content">	
						                    	 <p class="text_signfile text_centre">The COMPANIES ACT</p>    
						                    	 <p class="text_signfile text_centre">(Chapter 50) Sections 173(2•) (a)</p>  						 
						                    	 <p class="text_signfile text_centre">CONSENT TO ACT AS DIRECTOR AND STATEMENT OF</p>  						 
						                    	 <p class="text_signfile text_centre">NON DISQUALIFICATION TO ACT AS DIRECTOR</p>  						 
												 <br/>
												 <p class="text_signfile"><span>Name of Company:</span><span> ${companyName}  PTE. LTD. （自动替换）</span></p>    
												 <p class="text_signfile text_cn"><span>公司名字:</span><span> ${companyName} 私人有限公司（自动替换）</span></p> 
												 <p class="text_signfile"><span>Reg. No:</span><span> </span></p>    
												 <p class="text_signfile text_cn"><span>注册号码：</span><span> </span></p> 							 
												 <br/>					 
												<p class="text_signfile"><span>I, the under mentioned person, hereby consent to act as a director of the abovementioned company with effect from (date) and declare that:</span></p>    
												<p class="text_signfile text_cn"><span>我，下述人士，特此同意担任上述公司的董事，自（日期）起生效，并声明：</span></p> 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">(a)</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>
																I am not disqualified from acting as a director, in that:
															</span><br/>								
															<span class="text_cn">
																我够资格担任董事：
															</span>
														</p> 
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(i)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		I am not below 18 years of age and that I am otherwise of full legal capacity.
																	</span><br/>								
																	<span class="text_cn">
																		我超过18岁，我具有完全的法律行为能力。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>								
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(ii)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Within a period of 3 years preceding the data of this statement I have  not  had any disqualification order made  by the  High Court of Singapore against me under section 149A(1) of the Companies Act (“the Act”).
																	</span><br/>								
																	<span class="text_cn">
																		在本声明日期之前的3年内，我没有收到新加坡高等法院根据《公司法》（“公司法”）第149A（1）条对我发出的任何取消资格令。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>			
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(iii)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Within a period of 5 years preceding the date of this statement I have not had any disqualification order made by the High Court of Singapore against me under section 149(1) or 154(2) of the Act.
																	</span><br/>								
																	<span class="text_cn">
																		在本声明日期前5年内，我没有收到新加坡高等法院根据法案第149（1）或154（2）条对我发出的取消资格令。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>																	 
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(iv)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		That within a period of 5 years preceding 12th November 1993 I have not been convicted whether within or without Singapore, of any offence –
																	</span><br/>								
																	<span class="text_cn">
																		在1993年11月12日之前的5年内，本人没有被定罪，不论在新加坡境内或境外
																	</span>
																</p> 
																	<div class="row text_no_di2">
																		<div class="col-md-2 col-sm-2"> 
																			<p class="text_signfile">(A)</p> 
																		</div>		
																		<div class="col-md-10 col-sm-10"> 
																			<p class="text_signfile">
																				<span>
																					In connection with the promotion, formation or management of a corporation:
																				</span><br/>								
																				<span class="text_cn">
																					关于公司的推广、组建或管理：
																				</span>
																			</p> 
																		</div>	               		 						 
																	 </div>	
																	<div class="row text_no_di2">
																		<div class="col-md-2 col-sm-2"> 
																			<p class="text_signfile">(B)</p> 
																		</div>		
																		<div class="col-md-10 col-sm-10"> 
																			<p class="text_signfile">
																				<span>
																					Involving fraud or dishonesty punishable on conviction with imprisonment for 3 months or more; or
																				</span><br/>								
																				<span class="text_cn">
																					涉及欺诈或不诚实行为，一经定罪可判处3个月以上监禁；或
																				</span>
																			</p> 
																		</div>	               		 						 
																	 </div>												 
																	<div class="row text_no_di2">
																		<div class="col-md-2 col-sm-2"> 
																			<p class="text_signfile">(C)</p> 
																		</div>		
																		<div class="col-md-10 col-sm-10"> 
																			<p class="text_signfile">
																				<span>
																					Under section 157 (failure to act honestly and diligently as a director or making improper use of company information for gain) or under section 339 (failure to keep proper company accounts books) of the Act.
																				</span><br/>								
																				<span class="text_cn">
																					根据《公司法》第157条（未能诚实勤勉地担任董事或不当地利用公司信息谋取利益）或《公司法》第339条（未能妥善保管公司账簿）。
																				</span>
																			</p> 
																		</div>	               		 						 
																	 </div>													
															</div>	               		 						 
														 </div>	
														 <br/>
														<p class="text_signfile"><span>I am aware of and undertake to abide by my duties,, responsibilities and liabilities specified in the Act as well as under the common law where applicable, including the following key administrative and substantive duties, that is, to:</span><span> </span></p>    
														<p class="text_signfile text_cn"><span>本人了解并承诺遵守《公司法》以及普通法（如适用）规定的职责、责任和义务，包括以下主要行政和实质性职责，即：</span><span> </span></p> 	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(v)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		discharge my responsibilities in the company.
																	</span><br/>								
																	<span class="text_cn">
																		履行我在公司的责任
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(vi)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		ensure that I have a reasonable degree of skill and knowledge to handle the affairs of the company.
																	</span><br/>								
																	<span class="text_cn">
																		确保本人具备处理公司事务的合理技能和知识。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(vii)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		act honestly and be reasonably diligent in discharging my duties and act in the interest of the company without putting myself in a position of conflict of interest.
																	</span><br/>								
																	<span class="text_cn">
																		诚实行事，合理勤勉地履行我的职责，为公司的利益行事，不使自己处于利益冲突的境地。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(viii)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		employ the powers and assets that I am entrusted with for the proper purposes of the company and not for any collateral purpose.
																	</span><br/>								
																	<span class="text_cn">
																		为公司的正当目的而非为任何附属目的而运用授予我的权力和资产。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(ix)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		ensure that the company and I comply with all the requirements and obligations under the Act including those in respect of meetings, requisitions, resolutions, accounts, reports, statements, records and other documents on the company, filing and notices and any other prerequisites, and
																	</span><br/>								
																	<span class="text_cn">
																		确保公司和本人遵守《公司法》项下的所有要求和义务，包括有关公司的会议、申请、决议、账目、报告、报表、记录和其他文件、归档和通知以及任何其他先决条件，以及
																	</span>
																</p> 
															</div>	               		 						 
														 </div>		
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(x)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		account to the shareholders for my conduct of the affairs of the company and make such discussions that are incumbent upon me under the Act
																	</span><br/>								
																	<span class="text_cn">
																		向股东说明我处理公司事务的情况，并根据该法进行有责任的讨论
																	</span>
																</p> 
															</div>	               		 						 
														 </div>	
						               		 		</div>							
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">(b)</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>
																That-
															</span><br/>								
															<span class="text_cn">
																
															</span>
														</p> 
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(v)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		That within a period of 5 years preceding the date of this statement I have not been convicted, in Singapore or elsewhere, of any offence involving fraud or dishonesty punishable on conviction with imprisonment for 3 months or more.
																	</span><br/>								
																	<span class="text_cn">
																		在本声明日期前5年内，本人未在新加坡或其他地方被判犯有任何监禁3个月或以上涉及欺诈或不诚实的罪行。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>		
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(ii)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		Within a period of 3 years preceding the data of this statement I have  not  had any disqualification order made  by the  High Court of Singapore against me under section 149A(1) of the Companies Act (“the Act”).
																	</span><br/>								
																	<span class="text_cn">
																		在本声明日期之前的3年内，我没有收到新加坡高等法院根据《公司法》（“公司法”）第149A（1）条对我发出的任何取消资格令。
																	</span>
																</p> 
															</div>	               		 						 
														 </div>																								 
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(iv)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		That										
																	</span><br/>								
																	<span class="text_cn">
																		
																	</span>
																</p> 
																	<div class="row text_no_di2">
																		<div class="col-md-2 col-sm-2"> 
																			<p class="text_signfile">(A)</p> 
																		</div>		
																		<div class="col-md-10 col-sm-10"> 
																			<p class="text_signfile">
																				<span>
																					I have not been convicted of 3 or more offences under the Act in relation to the requirements on the filling of returns, accounts or other documents with the Registrar of Companies and have not had 3 or more orders of the High Court of Singapore made against me under section 13 or 399 of the Act in relation to such requirements.
																				</span><br/>								
																				<span class="text_cn">
																					我没有被判定犯下3项或3项以上根据公司法与在会计与监督局提交申报表、账目或其他文件的要求有关的罪行，也没有收到新加坡高等法院根据《公司法》第13条或第399条就这些要求对我作出的3条或更多的命令。
																				</span>
																			</p> 
																		</div>	               		 						 
																	 </div>	
																	<div class="row text_no_di2">
																		<div class="col-md-2 col-sm-2"> 
																			<p class="text_signfile">(B)</p> 
																		</div>		
																		<div class="col-md-10 col-sm-10"> 
																			<p class="text_signfile">
																				<span>
																					The last of any such convictions; and
																				</span><br/>								
																				<span class="text_cn">
																					最后一次定罪；以及
																				</span>
																			</p> 
																		</div>	               		 						 
																	 </div>												 
																	<div class="row text_no_di2">
																		<div class="col-md-2 col-sm-2"> 
																			<p class="text_signfile">(C)</p> 
																		</div>		
																		<div class="col-md-10 col-sm-10"> 
																			<p class="text_signfile">
																				<span>
																					I am not an undischarged bankrupt under section 148(1) of the Act.
																				</span><br/>								
																				<span class="text_cn">
																					我不是《公司法》第148（1）条规定的未解除破产的破产人。
																				</span>
																			</p> 
																		</div>	               		 						 
																	 </div>													
															</div>	               		 						 
														 </div>									 
														 <div class="row text_no_di2">
															<div class="col-md-2 col-sm-2"> 
																<p class="text_signfile">(vii)</p> 
															</div>		
															<div class="col-md-10 col-sm-10"> 
																<p class="text_signfile">
																	<span>
																		By virtue of the foregoing I am not disqualified from acting as a director of the above named company.										
																	</span><br/>								
																	<span class="text_cn">
																		根据上述规定，我没有丧失担任上述公司董事的资格。
																	</span>
																</p> 
																	<div class="row text_no_di2">
																		<div class="col-md-2 col-sm-2"> 
																			<p class="text_signfile">*(I)</p> 
																		</div>		
																		<div class="col-md-10 col-sm-10"> 
																			<p class="text_signfile">
																				<span>
																					I have read and understood the above statements; or
																				</span><br/>								
																				<span class="text_cn">
																					本人已阅读并理解上述声明；或
																				</span>
																			</p> 
																		</div>	               		 						 
																	 </div>	
																	<div class="row text_no_di2">
																		<div class="col-md-2 col-sm-2"> 
																			<p class="text_signfile">*(II)</p> 
																		</div>		
																		<div class="col-md-10 col-sm-10"> 
																			<p class="text_signfile">
																				<span>
																					 the above statements were interpreted to me in English/Mandarin/dialect by
																				</span><br/>								
																				<span class="text_cn">
																					以上陈述由以下人员用英语/普通话/方言向我解释 
																				</span>
																			</p> 
																		</div>	 
																	 </div>												 												
															</div>	               		 						 
														 </div>									 
													</div>	
												 </div>								
													<br/>							
													<p class="text_signfile"><span>before I executed this form and I confirm that the statements are true. I am also aware that I can be prosecuted in Court if I wilfully give any information on this form which is false.</span><span> </span></p>    
													<p class="text_signfile text_cn"><span>在我签署此表格之前，我确认这些陈述是真实的。本人亦明白，如本人故意在本表格上提供虚假资料，本人会被法庭检控。</span><span> </span></p> 	
						 							<br/>	
													<p class="text_signfile"><span>Confirmed and Signed by Interpreter and witness: </span><span> </span></p>    
													<p class="text_signfile text_cn"><span>翻译和见证人确认并签字：</span><span> </span></p> 	
						 							<br/>
													<p class="text_signfile"><span>Name:</span><span>DIRECTOR’S NAME </span></p>  
													<p class="text_signfile"><span>Address:</span><span> </span></p> 
						 							<p class="text_signfile"><span>NRIC E/Passport No.:</span><span> </span></p> 							            		 		              		 								
						 							<p class="text_signfile"><span>Nationality:</span><span> </span></p> 
						 							<br/>							
													<p class="text_signfile"><span>Signature:</span><span> </span></p> 
													<div class="row text_no_di2">
														<div class="col-md-6 col-sm-6"> 
																<p class="text_signfile"></p> 
														</div>		
														<div class="col-md-6 col-sm-6"> 
															<p class="text_signfile">
																<span>
																	Signature:
																</span><br/>								
																<span class="text_cn">															
																</span>
															</p> 
														</div>	 
													</div>	 	                   
												
						
						               		 </div>
						                </div>			
						              </div>          
						               
						               <div class="card priDesc" id="b5">
						                <div class="card-header">
						                  <h4>文件查看区</h4>
						                </div>
						                <div class="card-body fixcardhieht">
						                     <h4><b>Client Acceptance Form</b></h4><br/>
						                     <div class="media-content">
						                    	 <p class="text_signfile">CLIENT ACCEPTANCE FORM</p>    
						                    	 <p class="text_signfile text_cn">客户接受表</p>   
													<br/>
												<p class="text_signfile"><span>PART 1 – INFORMATION ABOUT CLIENT(S) / DIRECTOR (S) / BENEFICIAL OWNER(S)(to be completed by every individual connected to the (proposed) company).</span></p>   
												<p class="text_signfile"><span class="text_cn">第1部分-关于客户/董事/受益所有人的信息（由每个与（要注册的）公司有关的个人填写）</span></p> 							
												<p class="text_signfile"><span>SECTION A – INFORMATION ON INDIVIDUAL (S) / CLIENT(S)</span></p>  
												<p class="text_signfile"><span class="text_cn">A部分-个人/客户信息</span></p>							
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>Source and description of your wealth to start this company:</span><br/>
														<span class="text_cn">启动本公司的财富来源和说明：</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>								
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>Saving from income:</span><br/>
														<span class="text_cn">收入储蓄：</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>FULL NAME (INCLUDING ALIAS)：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">全名（包括别名）：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>NIRC/PASSPORT/BIRTH CERTIFICATE NO.：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">身份证/护照/出生证明编号：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>DATE OF BIRTH (dd/mm/yyyy)：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">出生日期（日/月/年）：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>NATIONALITY：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">国籍：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>RESIDENTIAL ADDRESS：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">居住地址：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>GENDER：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">性别：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>CONTACT NO.：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">联系电话：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>Past 5 years of working experience：</span><span> </span><br/>
														<span class="text_cn">过去5年的工作经验：</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>Highest Qualification from which education institution：</span><span></span><br/>
														<span class="text_cn">教育机构的最高资格：</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>		
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>HAVE YOU EVER BEEN CRIMINALLY CONVICTED?:</span>
														<span>
															<select class="custom-select c-select-info caf-selete">
																<option selected>NO</option>
																<option value="1">YES</option>
															</select>
														</span><br/>
														<span class="text_cn">你是否曾被刑事定罪？</span></p>								
						               		 		</div>	               		 						 
												 </div>							 
						
												<p class="text_signfile"><span>SECTION B - Description of the Company</span></p>   
												<p class="text_signfile"><span class="text_cn">B部分-公司描述</span></p> 													
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">1.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>What type of business activities the Company is to perform:</span><br/>
														<span class="text_cn">公司将开展何种业务活动：</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>
												<br/>						 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">2.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>Source of fund to start the Company:</span><br/>
														<span class="text_cn">创业资金来源：</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <br/>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">3.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>How is the sales of the Company being generated:</span><span> </span><br/>
														<span class="text_cn">公司的销售额是如何产生的：</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <br/>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">4.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>What the estimated turnover for the next 12 months：</span><span></span><br/>
														<span class="text_cn">未来12个月的预计营业额：</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <br/>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">5.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>Names of some of your supplier (If any)：</span><span></span><br/>
														<span class="text_cn">if any 表示可不填,一些供应商的名称（如有）</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <br/>						 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">6.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>Names of your customer (if any)：</span><span></span><br/>
														<span class="text_cn">if any 表示可不填,客户名称（如有）</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <br/>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">7.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>Background of the directors (e.g. Local or Foreigner, Past working experience etc )：</span><span></span><br/>
														<span class="text_cn">参考括号内提示,董事的背景（如：本地人或外国人、过去的工作经验等）</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <br/>							 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">8.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>What will the company's bank account be used mostly for? (eg. investments or operational account)：</span><span></span><br/>
														<span class="text_cn">参考括号内提示,公司的银行账户主要用于什么？（如投资或运营账户）</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <br/>							 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">9.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>Source of incoming funds into the bank account (Eg. operational revenue, funds from investors or holding company)：</span><span></span><br/>
														<span class="text_cn">参考括号内提示,银行账户流入资金来源（如营业收入、投资者或控股公司资金）</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <br/>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">10.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>Source and intended destination of outgoing funds from the company's bank account (Eg operational expenses, remit back to holding company or etc)：</span><span></span><br/>
														<span class="text_cn">公司银行账户流出资金的来源和目的地（如运营费用、汇回控股公司等）</span>
														<input type="text" class="form-control" ></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <br/>	
						
												<p class="text_signfile"><span>SECTION C – IDENTIFICATION OF BENEFICIAL OWNER (S)</span></p>
												<p class="text_signfile"><span>*BENEFICIAL OWNER means beside oneself there is an individual or group of individuals that, either directly or indirectly, has the actual power to vote or influence the transaction decisions of the company.</span></p>  
												<p class="text_signfile"><span class="text_cn">C部分-受益所有人的身份证明<br/>
												*受益所有人是指一个人或一群个人，他们直接或间接地有实际权力投票或影响公司的交易决定。</span></p>
												<p class="text_signfile"><span>Is the beneficial owner the same person as Section A? (If No, please provide the details as below)</span></p>  
												<p class="text_signfile"><span class="text_cn">受益所有人与A部分是同一人吗？（如不是，请提供以下详细信息）</span></p>							
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>FULL NAME (INCLUDING ALIAS)：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">全名（包括别名）：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>NIRC/PASSPORT/BIRTH CERTIFICATE NO.：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">身份证/护照/出生证明编号：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>DATE OF BIRTH (dd/mm/yyyy)：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">出生日期（日/月/年）：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>NATIONALITY：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">国籍：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>RESIDENTIAL ADDRESS：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">居住地址：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>GENDER：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">性别：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">•</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>CONTACT NO.：</span><span>客人注册时提供过信息，此处自动生成 </span><br/>
														<span class="text_cn">联系电话：</span>
														<input type="text" class="form-control"  disabled="disabled"></p>								
						               		 		</div>	               		 						 
												 </div>											 
												<p class="text_signfile"><span>PLEASE PROVIDE THE INFORMATION OF NATURE OF ARRANGEMENT (SUCH AS STRUCTURE OR OWNERSHIP) YOU HAVE WITH THE BENEFICIAL OWNER:</span></p>  
												<p class="text_signfile"><span class="text_cn">请提供您与受益所有人的安排性质（如结构或所有权）的信息：</span></p>							 
												<p class="text_signfile"><span>This person is a shareholder of the company</span></p>  
												<p class="text_signfile"><span class="text_cn">此人是公司股东</span></p>	
												<p class="text_signfile"><span></span>*BENEFICIAL OWNER means beside oneself there is an individual or group of individuals that, either directly or indirectly, has the actual power to vote or influence the transaction decisions of the company.</p>  
												<p class="text_signfile"><span class="text_cn">*受益所有人是指一个人或一群个人，他们直接或间接地有实际权力投票或影响公司的交易决定。</span></p>	
												<p class="text_signfile"><span>The Beneficial Owner confirms herewith that he / she has read and understood the foregoing and confirms that all statements made are truthful and correct.</span></p>  
												<p class="text_signfile"><span class="text_cn">受益所有人在此确认，他/她已阅读并理解上述内容，并确认所做的所有陈述均真实无误。</span></p>	
						<br/>
												<p class="text_signfile"><span>SECTION D – INFORMATION OF POLITICALLY EXPOSED PERSONS, THEIR IMMEDIATE FAMILY MEMBERS AND CLOSE ASSOCIATES</span></p>  
												<p class="text_signfile"><span class="text_cn">D部分-政治人物、其直系亲属和亲密联系人的信息</span></p>
												<p class="text_signfile"><span>Are any of the persons listed above a politically exposed person, that is, a person who is or has been entrusted with any prominent public function in Singapore, a country or territory outside Singapore, or by an international organisation at present?</span></p>  
												<p class="text_signfile"><span class="text_cn">以上所列人士是否为政治敏感人士，即在新加坡、新加坡以外的国家或地区或目前受国际组织委托担任任何重要公职的人？</span></p>
													<div class="col-md-12 col-sm-12 "> 
														<select class="custom-select c-select-info caf-selete">
															<option selected>NO</option>
															<option value="1">YES</option>
														</select>
						               		 		</div>	
												<p class="text_signfile"><span>Are any of the persons listed above a politically exposed person, that is, a person who is or has been entrusted with any prominent public function in Singapore, a country or territory outside Singapore, or by an international organisation who has stepped down from his prominent public function?</span></p>  
												<p class="text_signfile"><span class="text_cn">以上所列人士是否为政治敏感人士，即在新加坡、新加坡以外的国家或地区，或被某国际组织委托担任重要公职但已卸任其重要公职的人？</span></p>
													<div class="col-md-12 col-sm-12 "> 
														<select class="custom-select c-select-info caf-selete">
															<option selected>NO</option>
															<option value="1">YES</option>
														</select>
						               		 		</div>	
												<p class="text_signfile"><span>Are any of the persons listed above an immediate family member or a close associate of a politically exposed or a politically exposed person who has stepped down?</span></p>  
												<p class="text_signfile"><span class="text_cn">以上所列人士是否为政治敏感人士或已下台的政治人物的直系亲属或亲密伙伴？</span></p>
													<div class="col-md-12 col-sm-12 "> 
														<select class="custom-select c-select-info caf-selete">
															<option selected>NO</option>
															<option value="1">YES</option>
														</select>
						               		 		</div>	
												<br/>	
												<p class="text_signfile"><span><b>Client’s Declaration</b><br/>
												I declare that the information provided in this form is true and correct. I am aware that i may be subject to prosecution and criminal sanctions if I am found to have made any false statement which I know to be false or which l do not believe to be true, or if I have intentionally suppressed any material fact.
												</span></p>  
												<p class="text_signfile"><span class="text_cn">客户声明<br/>
						本人声明此表格所提供的资料是真实及正确的。我知道，如果我被发现对任何我知道是虚假的或我认为不是真的的东西作出虚假声明，或者如果我故意隐瞒任何重要事实，我可能会受到起诉和刑事制裁。
						</span></p>		
												<br/>	
												<p class="text_signfile"><span>Dated this (mm/dd/yyyy): <br/>
												Signature:
												<br/><br/><br/>
												</span></p>	
												<br/><br/><br/>	
												<p class="text_signfile"><span>Signed by Name:	<br/>
												NRIC No./Passport No.:  
												</span></p>		
												
						               		 </div>
						                </div>
						              </div>           
						               
						               <div class="card priDesc" id="b4">
						                <div class="card-header">
						                  <h4>文件查看区</h4>
						                </div>
						                <div class="card-body fixcardhieht">
						                     <h4><b>Application of Shares</b></h4><br/>
						                     <div class="media-content">
						                    	 <p class="text_signfile text_centre">APPLICATION FOR SHARES</p>    
						                    	 <p class="text_signfile text_centre text_cn">认股申请书</p>   
													<br/>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">To: </p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>${companyName} PTE. LTD.</span>
															<span class="text_cn">${companyName} 私人有限公司</span>
															<br/>
															<span>REGISTERED ADDRESS</span>
															<span class="text_cn">注册地址</span>
															<br/>
															<span>Singapore</span><br/>
															<span class="text_cn">新加坡</span>
														</p>								
						               		 		</div>	               		 						 
												 </div>		
												 <br/>	<br/>								 
												<p class="text_signfile">Dear Sirs,</p> 
												<p class="text_signfile text_cn">尊敬的先生们：</p> 
												<p class="text_signfile"><span>I, the undersigned, hereby apply for and request you to allot to me 2500 ordinary shares at SGD1.00 each in the capital of ${companyName}  PTE. LTD. (the “Company”), and I agree to pay SGD2500.00 for the above-mentioned shares in full in cash.</span></p> 
												<p class="text_signfile text_cn"><span>我，以下签字人，在此申请并要求您以${companyName} 私人有限公司（以下简称“公司”）的股本向我配发2500股每股1.00新加坡元的普通股，本人同意以现金全额支付上述股份2500.00新元。</span></p> 
												<p class="text_signfile"><span>I further undertake and agree to accept the number of shares that you may allot to me, subject to the conditions of the Constitution of the Company, and I authorize you to place my name on the Register of Members as holder in respect of the shares so allotted.</span></p> 
												<p class="text_signfile text_cn"><span>本人进一步承诺并同意接受贵公司根据本公司章程细则配发给我的股份数目，并授权贵公司将本人姓名作为所分配股份的持有人登记在股东名册上。</span></p> 
												<p class="text_signfile"><span>I also agree that this application is irrevocable and cannot be withdrawn.</span></p> 
												<p class="text_signfile text_cn"><span>本人亦同意本申请书不可撤销，不能撤回。</span></p> 
												<p class="text_signfile"><span>Share capital will be payable by cash or via through shareholder loan.</span></p> 
												<p class="text_signfile text_cn"><span>股本将以现金或股东贷款支付。</span></p> 				 
												 <br/>	<br/>	
												 
												<p class="text_signfile">Shareholder </p> 
												<p class="text_signfile">Signature:</p> 						
												<p class="text_signfile text_cn">股东签字</p> 
												 <br/>				
												<p class="text_signfile">Signed by:</p> 
												<p class="text_signfile">SHAREHOLDER</p> 				                   	                   	                    	                	             					   					   
						               		 </div>
						                </div>
						              </div>
						               
						               <div class="card priDesc" id="b3">
						                <div class="card-header">
						                  <h4>文件查看区</h4>
						                </div>
						                <div class="card-body fixcardhieht s_content_sty">
						                     <h4><b>ANNEX B - Notice for Controllers</b></h4><br/>
						                     <div class="media-content">
						                    	 <p class="text_signfile">ANNEX B – NOTICE FOR CONTROLLERS</p>    
						                    	 <p class="text_signfile text_cn">附录B——实际控制人通知</p>  
												 <br/> <br/> <br/>
						                     	 <p class="text_signfile">Date of notice:</p> 
						                    	 <p class="text_signfile text_cn">通知日期 </p>    
						                    	 <p class="text_signfile"> Dear CONTROLLER NAME</p> 
												 <p class="text_signfile text_cn">亲爱的实际控制人名字</p> 	
												<br/>						 
												 <p class="text_signfile"><span>We know or have reasonable grounds to believe that you are a registrable controller of ${companyName} PTE. LTD..
												 </span></p> 
												 <p class="text_signfile text_cn"><span>我们知道或有合理理由相信您是${companyName} PTE.LTD.的可注册的实际控制人。</span></p> 
												 <p class="text_signfile"><span>This notice is sent under section 386AG(2)(a) of the Companies Act (Cap. 50) and requires you to provide the following information within 30 days after the date of this notice. Failure to provide the information required by this notice may be an offence.</span></p> 
												 <p class="text_signfile text_cn"><span>本通知根据《公司法》（第50章）第386节发出并要求贵方在本通知发出后30天内提供以下信息。未能提供本通知书所规定的信息，可能被制裁。</span></p> 						
							                     <br/>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">1.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>You are a registrable controller* of ${companyName} PTE. LTD.. If you disagree to the above sentence, please do not continue or sign off.
														</span><br/>
														<span class="text_cn">您是${companyName}私人有限公司的可注册的实际控制人*。。如果您不同意上述判断，请不要继续或签字
														</span></p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-3 col-sm-3 nfc-2-width"> 
														<p class="text_signfile">Your reply:</p>
														 <p class="text_signfile text_cn"><span>
													您的答复：</span>
												 </p> 
						               		 		</div>		
													<div class="col-md-3 col-sm-3 "> 
														<select class="custom-select c-select-info nfc-selete">
															<option selected>YES</option>
															<option value="1">NO</option>
														</select>
						               		 		</div>	               		 						 
												 </div>	
						                    	 <p class="text_signfile"><span class="text_cn"> *	A registrable controller is defined as an individual or a legal entity that has "significant interest" in or "significant control" over the company. </span></p> 
												 <p class="text_signfile text_cn"><span class="text_cn">可注册的控制人是指对公司拥有“重大利益”或“重大控制权”的个人或法人实体。</span></p> 		
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">(a)</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															If your reply is yes and you are an individual, please provide the following particulars:
															</span><br/>								
														<span class="text_cn">
															如果您的答复是“是”，并且您是个人，请提供以下详细信息：
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(i)your full name: 
															</span><br/>								
														<span class="text_cn">
															您的全名：
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(ii)your aliases, if any:
															</span><br/>								
														<span class="text_cn">
															您的别名（如有）：
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(iii)your residential address: 
															</span><br/>								
														<span class="text_cn">
															您的住址：
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(iv)your nationality: 
															</span><br/>								
														<span class="text_cn">
															你的国籍：
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(v)your identity card number or passport number:    
															</span><br/>								
														<span class="text_cn">
															您的身份证号码或护照号码：
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(vi)the date on which you became an individual controller of ${companyName} PTE. LTD.:  
															</span><br/>								
														<span class="text_cn">
															您成为${companyName} PTE.LTD.的个人实际控制人的日期：
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
						                    	 <p class="text_signfile"> As per BizFile Company’s Date of Incorporation </p> 
												 <p class="text_signfile text_cn">根据BizFile公司成立日期</p> 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">(b)</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															If your reply is yes and you are a legal entity, please provide the following particulars:
															</span><br/>								
														<span class="text_cn">
															如果您的答复是“是”，并且您是一个法人实体，请提供以下详细信息
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(i)your name: 
															</span>						
														<span class="text_cn">
															法人实体的全名
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(ii)our unique entity number issued by the Registrar, if any  
															</span><br/>								
														<span class="text_cn">
															由注册处签发的公司注册号码
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(iii)the address of your registered office:
															</span><br/>								
														<span class="text_cn">
															法人实体的注册办公室地址：
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(iv)your legal form: 
															</span><br/>								
														<span class="text_cn">
															公司种类
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(v)the jurisdiction where, and statute under which, you are formed or incorporated:
															</span><br/>								
														<span class="text_cn">
															贵公司成立的司法管辖区和法规：
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(vi)the name of the corporate entity register of the jurisdiction in which you are formed or incorporated, if applicable: 
															</span><br/>								
														<span class="text_cn">
															贵公司成立所在司法管辖区的公司实体登记处的名称（如适用）
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
						 						 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(vii)the identification number or registration number on the corporate entity register of the jurisdiction where you are formed or incorporated, if applicable:</span><br/>								
														<span class="text_cn">
															贵公司成立所在司法管辖区的公司实体登记处上的识别号或注册号（如适用）
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>  
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(viii)the date on which you became a corporate controller of</span><br/>								
														<span class="text_cn">
															成为公司实际控制者的日期
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>   
						                    	 <p class="text_signfile"> ${companyName}  PTE. LTD.</p> 
												 <p class="text_signfile text_cn">公司名字</p> 
						
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">2.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>Do you know or have reasonable grounds to believe that any other person is a registrable controller of ${companyName} PTE. LTD. or is likely to have that knowledge?
														</span><br/>
														<span class="text_cn">你是否知道或有合理理由相信任何其他人是${companyName}私人有限公司的可注册的控制人，或很可能知道这一点？
														</span></p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-3 col-sm-3 nfc-2-width"> 
														<p class="text_signfile">Your reply:</p>
														 <p class="text_signfile text_cn"><span>
													您的答复：</span>
												 </p> 
						               		 		</div>		
													<div class="col-md-3 col-sm-3 "> 
														<select class="custom-select c-select-info nfc-selete">
															<option selected>NO</option>
															<option value="1">YES</option>
														</select>
						               		 		</div>	               		 						 
												 </div>		<br/>	<br/>				 
						                    	 <p class="text_signfile">If your reply is 'No' please sign off.</p> 
												 <p class="text_signfile text_cn">如果你的回答是“不”，请停止填写。</p> 
												<div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">(a)</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															If your reply is yes and the person is an individual, please provide the following    particulars to the best of your knowledge:
															</span><br/>								
														<span class="text_cn">
															如果您的回答是肯定的，并且此人是个人，请尽您所知提供以下详细信息：
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(i)the person's full name: 
															</span><br/>								
														<span class="text_cn">
															此人的全名：
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(ii)the person's aliases, if any:
															</span><br/>								
														<span class="text_cn">
															此人的别名，如有
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(iii)the person's residential address:  
															</span><br/>								
														<span class="text_cn">
															此人的住址：
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(iv)the person's nationality: 
															</span><br/>								
														<span class="text_cn">
															此人的国籍：
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(v)the person's identity card number or passport number:     
															</span><br/>								
														<span class="text_cn">
															此人的身份证号码或护照号码：
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(vi)the person's date of birth: 
															</span><br/>								
														<span class="text_cn">
															此人的出生日期
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(vii)the date on which the person became an individual controller of: <span>${companyName} PTE.LTD.:</span>
															</span><br/>								
														<span class="text_cn">
															此人成为${companyName} PTE.LTD.的个人实际控制人的日期：
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>						 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">(b)</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															If your reply is yes and the person is a legal entity, please provide the following particulars to the best of your knowledge:
															</span><br/>								
														<span class="text_cn">
															如果您的答复是“是”，并且此人是一个法人实体，请尽您所知提供以下详细信息：
															</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(i)the person's name:
															</span><br/>								
														<span class="text_cn">
															法人实体的名称
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(ii)the	person's	unique	entity	number	issued	by	the	Registrar,	if	any:
															</span><br/>								
														<span class="text_cn">
															法人实体的注册处签发的注册号码，如有：
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(iii)the address of the person's registered office:  
															</span><br/>								
														<span class="text_cn">
															法人实体的注册办公室地址
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(iv)the person's legal form:  
															</span><br/>								
														<span class="text_cn">
															法人实体的公司种类
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(v)the jurisdiction where, and statute under which, the person is formed or incorporated:
															</span><br/>								
														<span class="text_cn">
															法人实体成立的司法管辖区和法规：
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(vi)the name of the corporate entity register of the jurisdiction in which the person is formed or incorporated, if applicable: </span><br/>								
														<span class="text_cn">
															法人实体成立所在司法管辖区的公司实体登记处的名称（如适用）
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>
						 						 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														    <span>
																(vii)the identification number or registration number on the corporate entity register of the jurisdiction where the person is formed or incorporated, if applicable:</span><br/>			
															<span class="text_cn">
																法人实体成立所在司法管辖区的公司实体登记处上的识别号或注册号（如适用）
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>  
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile"></p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															(viii)the date on which the person became a corporate controller of:</span><span>${companyName} PTE. LTD.</span><br/>								
														<span class="text_cn">
															法人实体成为${companyName}私人公司的公司实际控制者的日期
															</span>
															<input type="text" class="form-control" >	
														</p> 
						               		 		</div>	               		 						 
												 </div>   
												 <br/>
												<p class="text_signfile">In this notice —</p> 
												<p class="text_signfile text_cn">在本通知中</p> 
												<p class="text_signfile"><span>"controller", "corporate controller", "individual controller" and "legal entity" have the meanings given to them in section 386AB of the Companies Act;</span></p> 
												<p class="text_signfile text_cn"><span>“控制人”、“公司控制人”、“个人控制人”和“法人实体”具有《公司法》第386AB节所赋予的含义；</span></p> 
												<p class="text_signfile"><span>"identity card" has the meaning given to it in section 2(1) of the National Registration Act (Cap. 201);</span></p> 
												<p class="text_signfile text_cn"><span>“身份证”具有《国家注册法》（第201章）第2（1）节中所赋予的含义；</span></p> 
												<p class="text_signfile"><span>"registrable" has the meaning given to it in section 386AC of the Companies Act.</span></p> 
												<p class="text_signfile text_cn"><span>“可注册的”具有《公司法》第386AC节所赋予的含义。</span></p> 
												 <br/>
												<p class="text_signfile">Yours sincerely,</p> 
												<p class="text_signfile text_cn">谨上</p> 
												<br/><br/><br/>
												<p class="text_signfile">CONTROLLER</p> 
												<p class="text_signfile text_cn">控制人的名字</p> 
												<br/>
												<p class="text_signfile">${companyName} PTE. LTD.</p> 
												<p class="text_signfile text_cn">${companyName}私人有限公司</p> 											 
						               		 </div>
						                </div>
						              </div>  
						               
						               <div class="card priDesc" id="b2">
						                <div class="card-header">
						                  <h4>文件查看区</h4>
						                </div>
						                <div class="card-body fixcardhieht s_content_sty">
						                     <h4><b>Secretary Agreement </b></h4><br/>
						                     <div class="media-content">
						                    	 <p class="text_signfile">Date: Signing Date</p>    
						                    	 <p class="text_signfile text_cn">日期：签署日期</p>         
						                     	 <p class="text_signfile">To:	Rsin Group Pte. Ltd. Re:	Services</p> 
						                    	 <p class="text_signfile text_cn">致：  Rsin Group Pte. Ltd.关于：  服务</p>    
						                    	 <p class="text_signfile"> Agreement (this “Agreement”) </p> 
												 <p class="text_signfile text_cn">协议（本“协议”）</p> 						
												 <p class="text_signfile"><span>Proposed Name of Company: ${companyName}  PTE. LTD. (the “Company”) I/We, <br/>the undersigned hereby agree as follows to:</span></p> 
												 <p class="text_signfile text_cn">拟定公司名称：${companyName} 私人有限公司（以下简称“公司”），我/我们，签字人在此同意以下：</p> 
												 <br/>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">1.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>${companyName}  PTE. LTD. appoint Rsin Group Pte. Ltd. & related companies to provide us with one or more of the following services: incorporation of a company in Singapore, corporate secretarial services, employment pass application, financial statement compilation and filing, tax computation and filing.</span><br/>
														<span class="text_cn">${companyName} 私人有限公司指定Rsin Group Pte. Ltd.及相关公司为我们提供以下一项或多项服务：在新加坡成立公司、公司秘书服务、就业证申请、财务报表编制和归档、税务计算和备案。</span></p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">2.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName}  PTE. LTD. consent to act as a director of the Company of name as proposed. We agree and acknowledge that the proposed name is subject to approval by the relevant authorities in Singapore (including but not limited to the Accounting and Corporate Regulatory Authority (“ACRA”)) and there is no guarantee that the proposed name will be approved by the relevant authorities. In the event that the proposed name is not approved, we agree to work with Rsin Group Pte. Ltd. & related companies & related companies to resolve this issue with the relevant authorities.</span><br/>								
														<span class="text_cn">
															${companyName} 私人有限公司同意担任拟定名字的公司董事。我们同意并了解，拟定名称须经新加坡相关当局（包括但不限于会计与企业监管局（“ACRA”）的批准），且不能保证提议的名称将获得相关当局的批准。如果提议的名称未获批准，我们同意与Rsin Group Pte. Ltd.和相关公司合作，与相关当局解决该问题。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>		
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">3.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName}  PTE. LTD. declare that we are not disqualified from acting as a director of a company incorporated pursuant to the Companies Act (Cap. 50 of Singapore) and have given our consent to act as a director for the Company.
														</span><br/>
														<span class="text_cn">
															${companyName}  PTE.LTD.声明，我们具有担任根据《公司法》（第50章）注册成立的公司的董事的资格，并同意担任公司董事。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">4.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName}  PTE. LTD. declare that the information provided and declaration made on any of our forms and documents and attachments thereto are completed in a manner that is true, accurate and complete. Further acknowledge (i) that Rsin Group Pte. Ltd. & related companies will not maintain any hard-copy records of any data and/or documents sent to them by us and (ii) that any and all information provided to Rsin Group Pte. Ltd. & related companies & related companies will be made via www.ourwebaddress.com or such other web address as Rsin Group Pte. Ltd. & related companies & related companies may from time to time determine and agree to hold Rsin Group Pte. Ltd. & related companies & related companies harmless for any claims which may arise directly or indirectly as a result of such internet based submission and/or hosting of data and/or documents by Rsin Group Pte. Ltd. & related companies & related companies.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司声明，我们在任何表格、文件及其附件上提供的信息和声明均以真实、准确和完整的方式完成。进一步了解（i）Rsin Group Pte.Ltd.和相关公司将不会保留我们发送给他们的任何数据和/或文件的任何硬拷贝记录，以及（ii）向Rsin Group Pte.Ltd.和相关公司及相关公司提供的任何和所有信息将通过www.我们的网址.com网站或我们的其他网址，如Rsin Group Pte.Ltd.对于因Rsin Group Pte.Ltd.和相关公司基于互联网提交和/或托管数据和/或文件而直接或间接产生的任何索赔，有限公司和相关公司及相关公司可不时决定并同意使Rsin Group Pte. Ltd.及其关联公司免受损害&相关公司。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>							 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">5.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName}  PTE. LTD. authorize Rsin Group Pte. Ltd. & related companies & related companies to name such individual as a secretary of the Company in relation to the provision of company secretary services to us by Rsin Group Pte. Ltd. & related companies & related companies.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司授权Rsin Group PTE.LTD.及关联公司及关联公司提名一个个人担任公司秘书，用于Rsin Group PTE.LTD.及关联公司及关联公司向本公司提供公司秘书服务。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">6.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName}  PTE. LTD. authorize Rsin Group Pte. Ltd. & related companies and its designated agents/staffs to initiate the filing electronically (Bizfile) with ACRA (or such other agency as may be gazette by the Registrar of Companies pursuant to the Companies Act (Cap. 50 of Singapore)) for the incorporation, corporate secretarial services and such other services contemplated herein and to communicate with ACRA for rectifying any omissions if necessary.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司授权Rsin Group PTE.LTD.及相关公司和它指定的代理人/员工向ACRA以电子方式（Bizfile）提交文件（或公司注册处根据《公司法》（新加坡第50章）公布的其他机构）。提供注册、公司秘书服务和本协议规定的其他服务，并与ACRA沟通以修改任何遗漏（如有需要）。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">7.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName}  PTE. LTD. confirm and agree that all details as stated in the ACRA business profile shall be deemed true and correct unless we inform you of any error within seven days from the date of incorporation.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司确认并同意，除非我们在公司成立之日起七天内通知您有任何错误，否则bizfile所述的所有细节均视为真实和正确的。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">8.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName}  PTE. LTD. agree and acknowledge that Rsin Group Pte. Ltd. & related companies’s liability and responsibility relating to the Company and/or any services provided to us shall only commence on and after the date of appointment. Rsin Group Pte. Ltd. & related companies shall not be liable and/or responsible for any services (including but not related to corporate secretarial services) and liabilities and/or documents arising therefrom which were rendered by third parties to us.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司同意并了解，Rsin Group Pte. Ltd.和相关公司与我们公司和/或向我们提供的任何服务的责任应仅在任命之日和之后开始。Rsin Group Pte.Ltd.及相关公司不对第三方向我方提供的任何服务（包括但不与公司秘书服务相关）以及由此产生的责任和/或文件负责。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">9.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName}  PTE. LTD. understand and agree to be bound by the terms of Rsin Group Pte. Ltd. & related companies’s e-commerce services which includes digital signatures (“e-signature”) and, unless required, shall be no physical, paper documents. We aware that any physical documents required through Rsin Group Pte. Ltd. & related companies to be satisfied by directly and personally printing, at our own expense and that samples of thereof perused as stipulated in Annexure A.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司理解并同意受Rsin Group Pte. Ltd.和相关公司的电子商务服务条款的约束，包括数字签名（“电子签名”），除非要求，都不用亲临，也不是纸质文件。我们了解，通过Rsin Group Pte. Ltd.和相关公司要求的任何实物文件，均需由我方自费直接亲自打印，见附录A的规定细读样本。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">10.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName}  PTE. LTD. fully understand and acknowledge that there is no guarantee of success of any application (including but not limited to change of company name and employment pass application) (be it fresh applications or renewals) submitted by Rsin Group Pte. Ltd. & related companies for us.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司完全理解并了解，Rsin Group PTE.LTD.及相关公司为我公司提交的任何申请（包括但不限于公司名称变更和就业证申请）（无论是新申请还是续签）不保证成功。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>							 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">11.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName}  PTE. LTD. fully understand and acknowledge that the shareholders’ immediate liability and obligation to pay up the said amount as stated as paid-up capital in the ACRA business profile of the Company.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司完全理解并了解，股东有立即责任和义务按照公司ACRAbizfile的实收资本支付上述金额。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>							 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">12.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName} PTE. LTD. fully indemnifies and hold Rsin Group Pte. Ltd. & related companies and/or its officers, employees, contractors, sub-contractors, agents from any loss, expenses, costs or damages in respect of inaccurate or incomplete information filed through the services howsoever arising. For compliance purposes with the relevant law or statute in Singapore, in the event of any provision of nominee(s) nominated to act for us (the instructing party or/and the beneficial owners), as the case may be, we shall execute such letters of indemnity, nominee services agreement and/or such other documents and/or agreements as may from time to time be required by Rsin Group Pte. Ltd. & related companies.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司对Rsin集团私人有限公司及相关公司和/或其高级职员、雇员、承包商、分包商、代理人，无论由何种方式产生与不准确不完整提供信息引起的的任何损失、费用、成本或损害，提供全额赔偿。为了遵守新加坡的相关法律或法规，如果被提名人代表我们（指示方或/和受益所有人）的情况下，无论何种情况，我方将根据Rsin集团私人有限公司及相关公司随时要求签署赔偿书、提名人服务协议和/或其他文件和/或协议。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>								 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">13.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName}  PTE. LTD. fully indemnifies and hold Rsin Group Pte. Ltd. & related companies and/or its officers, employees, contractors, sub-contractors, agents harmless from and against all loss, expenses, damages, costs, claims or liabilities from any party.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司对Rsin Group PTE.LTD.及相关公司和/或其高级职员、员工、承包商、分包商、代理人的来自任何一方的所有损失、费用、损害、成本、索赔的责任承担完全赔偿责任。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>							 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">14.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName} PTE. LTD. agree and acknowledge that any claim arising directly from any service provided by Rsin Group Pte. Ltd. & related companies pursuant to this Agreement, Rsin Group Pte. Ltd. & related companies shall only be liable for claims not exceeding the amount equivalent to a total of two times the fee relating to that service which we have paid to Rsin Group Pte. Ltd. & related companies in the 12- months period immediately preceding such claim. In the event that a claim relates to two or more services, Rsin Group Pte. Ltd. & related companies shall only be liable for a total of two times the amount relating to a single service which we have paid to Rsin Group Pte. Ltd. & related companies in the 12-months period immediately preceding such claim.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司同意并了解，直接由Rsin集团私人有限公司和相关公司根据本协议提供的任何服务引起的任何索赔，Rsin Group Pte.Ltd.及相关公司仅对索赔金额不超过我方在索赔前12个月内向Rsin Group Pte.Ltd.及相关公司支付的那个服务费总额的两倍的索赔负责。如果索赔涉及两个或两个以上的服务，Rsin集团私人有限公司和相关公司只需承担我们在索赔前12个月内支付给Rsin集团私人有限公司和相关公司的一个服务的总额的两倍。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>							 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">15.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName} PTE. LTD. agree that in relation to renewal fees, retainer fees and corporate secretarial fee for the next year, will always due and payable in advance upon the expiry of the current year. We understand that the amount paid for incorporation and secretarial services shall NOT include the accounting, financial report, and tax services unless otherwise stated in the invoice.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司同意，关于下一年的续约费、聘用费和公司秘书费，将始终在当年到期时提前支付。我方理解，除非发票上另有说明，否则为公司注册和秘书服务支付的金额不包括会计、财务报告和税务服务。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>							 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">16.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName} PTE. LTD. agree that Rsin Group Pte. Ltd. & related companies shall not be obligated to provide any secretarial services, task, advice, etc. (including annual general meetings, annual reports, etc.) before the relevant fees are paid up.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司同意，Rsin集团私人有限公司及相关公司在相关费用没有被付清之前没有义务提供任何秘书服务、任务、建议等（包括年度股东大会、年度报告等）。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>						 
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">17.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															${companyName} PTE. LTD. agree and acknowledge that Rsin Group Pte. Ltd. & related companies may, from time to time, without notice, update or revise the terms of Service. Rsin Group Pte. Ltd. & related companies may notify by email or by posting the updated or revised terms of service on its website.
														</span><br/>
														<span class="text_cn">
															${companyName} 私人有限公司同意并承认，Rsin集团私人有限公司及相关公司可随时更新或修订服务条款，恕不另行通知。Rsin集团私人有限公司及相关公司可通过电子邮件或在其网站上发布更新或修订的服务条款通知
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">18.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															SIGNING OF BANK DOCUMENT AND OTHER RESOLUTION – confirm and agree that the secretary will never sign on behalf of other director(s) on any documents, including but not limited to bank documents, resolutions for tenancy agreement, etc.
														</span><br/>
														<span class="text_cn">
															签署银行文件和其他决议——确认并同意秘书绝不代表其他董事签署任何文件，包括但不限于银行文件、租赁协议决议等。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">19.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															Rsin Group Pte. Ltd. & related companies RESERVES THE RIGHT TO ACCEPT OR REJECT ANY APPLICATIONS SUBMITTED.
														</span><br/>
														<span class="text_cn">
															Rsin Group Pte. Ltd.及相关公司保留接受或拒绝任何递交的申请的权利。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">20.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															On termination of any services (including but not limited to corporate secretarial services) provided by Rsin Group Pte. Ltd. & related companies pursuant to this Agreement, Rsin Group Pte. Ltd. & related companies shall not be obliged to furnish hard-copies of the documents prepared by Rsin Group Pte. Ltd. & related companies which have been made available to us via our web. Any time cost involved in preparation of the handover of any services are chargeable separately.
														</span><br/>
														<span class="text_cn">
															在Rsin集团私人有限公司和相关公司根据本协议提供的任何服务（包括但不限于公司秘书服务）终止时，Rsin集团私人有限公司和相关公司无义务提供通过我们的网站我公司准备的文件的硬拷贝。准备移交任何服务所涉及的任何时间成本均应单独收取
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">21.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															For any share transaction, we agree that new share certificates with new numbers will be issued to all the affected shareholders (new and existing). All previous shares certificates for the affected will be cancelled. (Example: Shareholder A (70%) - holds share cert number 5 and Shareholder B (30%) - holds share cert number 6 entered into a share transfer agreement for B to transfer to A 20% of his shares. After the transfer, both share certs 5 and 6 will be canceled. Results: Shareholder A (90%) will be issued with new share cert number 7, Shareholder B (10%) will be issued with new share cert number 8).
														</span><br/>
														<span class="text_cn">
															对于任何股份交易，我们同意向所有受影响的股东（新的和现有的）发行带有新编号的新的股份证书。受影响人士之前的所有股份证书将被注销。（例如：股东A（70%）—持有5号股权证书，B号股东（30%）—持有6号股权证书—签订了一份股份转让协议，要求B将其20%的股份转让给A。转让后，第5张和第6张股票将被注销。结果：股东A（90%）将获得7号新股证书，股东B（10%）将获得8号新股证书。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <div class="row text_no_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">22.</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															We agree that the share certificates numbering will commence from number “31” (thirty one), regardless the previous number sequence. (applicable for all new, existing, carry over companies and companies which change its company secretarial service provider to Rsin Group Pte. Ltd. & related companies EXCEPT companies incorporated through our website system)
														</span><br/>
														<span class="text_cn">
															我们同意，股票编号将从“31”（三十一）开始，而不考虑之前的编号顺序。（适用于所有新的、现有的、结转的公司以及将其公司秘书服务提供商变更为Rsin集团私人有限公司的公司和相关公司，但通过我们的网站系统注册的公司除外）
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>	
												 <p class="text_signfile">
												 	<span>
														For the purposes of this Agreement, “party” or “parties” shall refer to Rsin Group Pte. Ltd. & related companies on the one hand and us on the other hand.<br/>
														<span class="text_cn">在本协议中，“一方”或“双方”应指Rsin集团私人有限公司和相关公司，另一方是指我们。</span><br/>
														This Agreement and the documents referred to herein are in substitution for all previous agreements between all or any of the parties, and contain the whole agreement between the parties relating to the subject matter of this Agreement.<br/>
														<span class="text_cn">本协议和本协议提及的文件取代双方或任何一方之前达成的所有协议，并包含双方之间关于本协议标的物的的完整协议。</span><br/>
														In the event of any conflict, contradiction or inconsistency between the provisions in this Agreement and any other document and/or agreement entered into between us and Rsin Group Pte. Ltd. & related companies, this Agreement shall prevail.<br/>
														<span class="text_cn">如果本协议的规定与我方与瑞星集团私人有限公司及相关公司签订的任何其他文件和/或协议之间存在任何冲突、矛盾或不一致，则以本协议为准。</span><br/>
														Each of the provisions of this Agreement is several and distinct from the others and if at any time one or more of the provisions is or becomes invalid, unlawful or unenforceable, the validity, legality and enforceability of the remaining provisions contained herein shall not in any way be affected or impaired and this Agreement shall be construed as if such invalid unlawful or unenforceable provision had never been contained herein.<br/>
														<span class="text_cn">本协议的每一条规定都是单独的，并且与其他条款不同，如果在任何时候一条或多条规定无效、不合法或不可执行，本协议其余条款的有效性、合法性和可执行性不得以任何方式受到影响或损害，本协议应予以解释就好像这些无效的、非法的或不可执行的条款从未包含在本文中。</span><br/>
														No alteration or amendment in respect of this Agreement will be effective unless in writing and executed by each of the parties.<br/>
														<span class="text_cn">对本协议的任何更改或修订，除非以书面形式并由各方签署，否则无效</span><br/>
														A person who is not a party to this Agreement has no right under the Contracts (Rights of Third Parties) Act to enforce any term of this Agreement.<br/>
														<span class="text_cn">根据《合同法》（第三方权利），非本协议一方的人士无权执行本协议的任何条款。</span>
													</span>
												 </p>   
						 						 <p class="text_signfile"><span>
													This Agreement shall be governed by and construed with in accordance with the laws of Singapore. The parties shall submit to the exclusive jurisdiction of the courts of Singapore.<br/>
													<span class="text_cn">本协议受新加坡法律管辖并按新加坡法律解释。双方应服从新加坡法院的专属管辖权。</span></span>
												 </p>   
												 <br/>   <br/> 
												 <div class="row text_no_di2">
													<div class="col-md-6 col-sm-6"> 
														<p class="text_signfile">Signed by:</p> 
														<br/><br/>
														<p class="text_signfile">Signed by 客户 1	</p> 
														<br/><br/>
														<p class="text_signfile">Signed by:</p> 
														<br/><br/>
														<p class="text_signfile">Signed by 客户 2	</p> 
						               		 		</div>		
													<div class="col-md-6 col-sm-6"> 
														<p class="text_signfile">For and on behalf of Rsin Group Pte. Ltd.:</p> 
														<br/><br/>
														<p class="text_signfile">Name: <span class="text_cn">秘书公司代表 </span></p> 
						               		 		</div>	               		 						 
												 </div>							 
						               		 </div>
						                </div>
						              </div>              
						               
						               <div class="card priDesc view" id="b1">
						                <div class="card-header">
						                  <h4>文件查看区</h4>
						                </div>
						                <div class="card-body fixcardhieht">
						                     <h4><b>First Director Meeting Resolution</b></h4><br/>
						                     <div class="media-content">
						                    	 <p class="text_signfile text_centre">${companyName} PTE. LTD.</p>    
						                    	 <p class="text_signfile text_centre text_cn">${companyName} 私人有限公司</p>         
						                     	 <p class="text_signfile text_centre">(INCORPORATED IN THE REPUBLIC OF SINGAPORE)</p> 
						                    	 <p class="text_signfile text_centre text_cn">（在新加坡共和国注册成立）</p>    
						                    	 <p class="text_signfile">MINUTES OF THE FIRST BOARD OF DIRECTORS MEETING OF THE COMPANY </p> 
												 <p class="text_signfile text_cn">公司第一届董事会会议记录</p> 
												 <p class="text_signfile text_centre">AGENDA</p> 
												 <p class="text_signfile text_centre text_cn">会议议程</p> 
												 <div class="row text_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">BOD 1</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>ALLOTMENT OF ADDITIONAL SHARES</span><br/> 
														<span class="text_cn">分发额外股份</span><br/> 
														<span>Subject to authority being given under section 161 of the Companies Act (Cap.
															50), new additional shares, be and are hereby allotted for cash, and that the Common Seal of the Company be affixed the share certificate to be issued in accordance with the Constitution of the Company.
															</span><br/>
														<span class="text_cn">根据《公司法》（第50章）第161节,新增发股份，特此以现金方式配发，并在根据公司章程签发的股份证书上加盖公司公章。</span></p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">BOD 2</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															CERTIFICATE OF INCORPORATION AND CONSTITUTION OF COMPANY
														</span><br/> 
														<span class="text_cn">
															公司注册证书和公司章程<br/>
														</span>
														<span>
															It be noted that the company was incorporated as per ACRA Bizfile and that the Registration Number assigned to it as per ACRA Bizfile. The Notice of Incorporation was tabled together with a copy of the Constitution of the Company.
														</span><br/>
														<span class="text_cn">
															值得注意的是，该公司是根据ACRA Bizfile注册成立的，注册号是根据ACRA Bizfile分配的。公司注册通知书连同公司章程副本一并提交。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>						 					
												 <div class="row text_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">BOD 3</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															FIRST DIRECTORS<br/> 
														</span>
														<span class="text_cn">
															第一任董事<br/> 
														</span>
														<span>
															It was resolved that the following persons stated in ACRA Bizfile profile be confirmed as First Directors of the Company retrospective from the date of incorporation of the Company.
														</span><br/>
														<span class="text_cn">
															经决议，自公司成立之日起，ACRA Bizfile profile中所述的以下人员被确认为公司的第一任董事。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">BOD 4</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															REGISTERED OFFICE<br/> 
														</span>
														<span class="text_cn">
															注册地址<br/> 
														</span>
														<span>
															It was resolved that the situation of the Company's Registered Office at ${address} retrospective from the date of incorporation to be confirmed.
														</span><br/>
														<span class="text_cn">经决议，公司注册办公地址位于${address}，自公司成立之日起予以确认。</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>                   
												 <div class="row text_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">BOD 5</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															FINANCIAL YEAR END<br/>
														</span> 
														<span class="text_cn"><br/>财务年结日</span>
														<span>
															It was resolved that the first financial period of the Company be made up for the period from the date of incorporation to the last day of the 11th month since incorporation and that the subsequent financial year end will be the same  annually until otherwise decided.
														</span><br/>
														<span class="text_cn">
															经决议，公司的第一个财务年度从公司成立之日起至公司成立后第11个月的最后一天，除非更改年结日，接下来的财务年结日将是每年相同。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>  
												 <div class="row text_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">BOD 6</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span>ALLOTMENT AND ISSUE OF SHARES<br/> </span>
															<span class="text_cn">股份配发<br/> </span>
															<span>
																It was resolved that the signatories to the Memorandum be registered as members in respect of the shares which are subscribed at an issue price of SGD $1 per share namely:									
															</span><br/>
															<span class="text_cn"> 经决议，以下人员为股东，股份以每股1新元的发行价格认购，即：<br/> </span>
															
															${shareholderAndStock }
														</p> 
						               		 		</div>	               		 						 
												 </div>						 						        
												 <div class="row text_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">BOD 7</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
														<span>
															DISPENSING WITH DIRECTOR MEETING<br/> 
														</span>
														<span class="text_cn">免除董事会会议<br/></span>
														<span>
															Resolved that pursuant to the provision of the Companies Act, Cap 50, the company hereby dispenses with the holding of first director meetings and all subsequent director meeting, and that this resolution shall remain in full force and effect until otherwise resolved by shareholders or overridden by the operation of any provision of the Companies Act, Cap 50. Therefore while this resolution remains in force, matters which would normally be put before the director when they meet to hold the Meeting, shall instead be circulated to the directors and resolved by written means.									
														</span><br/>
														<span class="text_cn">
															决议：根据《公司法》第50章的规定，本公司特此免除召开第一次董事会议和所有后续董事会议，且本决议应保持完全效力，直至股东另行决议或因公司任何条款的实施而被推翻法案，第50章。因此，在本决议仍然有效的情况下，通常会在董事会开会召开会议时提交董事会的事项，应传阅董事会并以书面方式解决。
														</span>
														</p> 
						               		 		</div>	               		 						 
												 </div>
												 <div class="row text_di2">
													<div class="col-md-2 col-sm-2"> 
														<p class="text_signfile">BOD 8</p> 
						               		 		</div>		
													<div class="col-md-10 col-sm-10"> 
														<p class="text_signfile">
															<span> CONCLUSION<br/> </span>
															<span class="text_cn">结论<br/> </span>
															<span>There being no other business, the meeting was ended.<br/></span>
															<span class="text_cn">没有其它事务，会议结束了。</span>
														</p> 
						               		 		</div>	              		 		               		 						 
												 </div>		
												 <p class="text_signfile">SIGNED AS A CORRECT RECORD</p> 				 
												 <p class="text_signfile text_cn">作为正确记录签字</p> 	
											     <br/><br/><br/><br/><br/><br/>	
												 <p class="text_signfile">DIRECTOR <span class="text_cn">董事</span></p> 				 
												 <p class="text_signfile">Dated this Signing Date <span  class="text_cn">日期</span></p> 				                   	                   	                    	                	             					   					   
						               		 </div>
						                </div>
						              </div>              
						                                                      
						            </div>
						            
						            <div class="col-lg-12 col-md-12 col-12 col-sm-12 card">
						             <div class="row">
						              <div class="col-lg-7 col-md-12 col-12 col-sm-12"> 
						              		<div class="card-header"> <h4>电子签名区域</h4> 
						              		</div>
											<div class="form-group row">										
													<!-- signature pad -->
													<form id="UploadForm" name="UploadForm" action="/api/onlineSubmitSignture">
													  <input type="hidden" name="anotherinputfield" value="some value" />
													</form>
													<div id="signature-pad" class="signature-pad col-lg-12 col-md-12 col-12 col-sm-12">
													    <div class="signature-pad--body">
													      <canvas width="460" height="300" style="border:2px solid #000000;"></canvas>
													    </div>
													    <div class="signature-pad--footer">
													      <div class="signature-pad--actions">
														      <div class="buttons sign_btn">                    
											                      <button type="button" class="btn btn-default icon-left btn-primary" disabled="disabled" id="submit_sign" data-action="save-png">
											                      	<div data-toggle="tooltip" title="请阅读所有待签名文件并完成打勾确认" ><i class="fas fa-check"></i> 提交 </div>
											                      </button>
											                      <button class="btn btn-icon icon-left btn-primary" data-action="clear"><i class="fas fa-times"></i>清空</button>
											                      <button class="btn btn-icon icon-left btn-primary" data-action="undo"><i class="fas fa-times"></i>撤销还原</button>
											                  </div>	
													      </div>
													    </div>
													</div>
													<!-- <textarea class="form-control textareaheight signaturediv"
																id="signaturediv" placeholder="请在此处签名" >
													</textarea>	 -->
												</div>	  
									  </div>					                    					
						              <div class="col-lg-5 col-md-12 col-12 col-sm-12"> 				                     
					                  	<div class="card-header"> <h4>生成电子签名文件区域</h4> </div>
						                	<div class="signature-pad--footer">
										      <div class="signature-pad--actions">
											      <div class="row buttons sign_btn" id="withSingatureDoc"></div>	
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
		                    <div id="Signature" class="tabcontent" style="display:none; width: 100%;">
						          <div class="row"> 				          
						            <div class="col-lg-12 col-md-12 col-12 col-sm-12 card">
						              <div class="card-header"> 
						              	<h4>上传线下签名文件</h4> 
						              </div> 
						              <div class="card-body fixcardhieht">
						                  <ul class="list-unstyled list-unstyled-border">
						                  
						                  	<c:if test="${isDirector || isNamedDirector}">
							                    <li class="media leftTab active"  >
							                      <div class="media-body">
			 											<div class="row"> 				          
							          						 <div class="col-lg-4 col-md-12 col-12 col-sm-12">				                      
													              <div class="">First Director Meeting Resolution</div> 
													         </div>     
							          						 <div class="col-lg-2 col-md-12 col-12 col-sm-12">												              										              										                				                       
															    <div class="btn-group btn-group-sm">
																    <button type="button" class="btn btn-default viewFile" onclick="previewDoc(1)">查看</button>
																    <button type="button" class="btn btn-default downloadFile" id="downloadDoc1">下载</button>
																</div>	
															 </div>		
							          						 <div class="col-lg-6 col-md-12 col-12 col-sm-12">		
																  <input type="file" id="myFile1" placeholder="First Director Meeting Resolution"/>
																  <input type="button" class="btn btn-default viewFile" onclick="preview(1);" value="预览" >
																  <input type="button" id="uploaddoc1" onclick="SubForm(1);" value="上传" >
															 </div>		
														 </div>											 	                        	                                            
							                      </div>
							                    </li>
						                    </c:if>
						                    
						                    <c:if test="${isShareholder}">
							                    <li class="media leftTab"  >
							                      <div class="media-body">
			 											<div class="row"> 				          
							          						 <div class="col-lg-4 col-md-12 col-12 col-sm-12">				                      
													              <div class="">Secretary Agreement</div> 
													         </div>     
							          						 <div class="col-lg-2 col-md-12 col-12 col-sm-12">												              										              										                				                       
															    <div class="btn-group btn-group-sm">
																    <button type="button" class="btn btn-default viewFile" onclick="previewDoc(2)">查看</button>
																    <button type="button" class="btn btn-default downloadFile" id="downloadDoc2">下载</button>
																</div>	
															 </div>		
							          						 <div class="col-lg-6 col-md-12 col-12 col-sm-12">		
																  <input type="file" id="myFile2" placeholder="Secretary Agreement"/>
																  <input type="button" class="btn btn-default viewFile" onclick="preview(2);" value="预览" >
																  <input type="button" id="uploaddoc2" onclick="SubForm(2);" value="上传" >
															 </div>		
														 </div>											 	                        	                                            
							                      </div>
							                    </li>				                    
						                    </c:if>

						                    <c:if test="${isShareholder}">
							                    <li class="media leftTab"  >
							                      <div class="media-body">
			 											<div class="row"> 				          
							          						 <div class="col-lg-4 col-md-12 col-12 col-sm-12">				                      
													              <div class="">ANNEX B - Notice for Controllers</div> 
													         </div>     
							          						 <div class="col-lg-2 col-md-12 col-12 col-sm-12">												              										              										                				                       
															    <div class="btn-group btn-group-sm">
																    <button type="button" class="btn btn-default viewFile" onclick="previewDoc(3)">查看</button>
																    <button type="button" class="btn btn-default downloadFile" id="downloadDoc3">下载</button>
																</div>	
															 </div>		
							          						 <div class="col-lg-6 col-md-12 col-12 col-sm-12">		
																  <input type="file" id="myFile3" placeholder="Notice for Controllers"/>
																  <input type="button" class="btn btn-default viewFile" onclick="preview(3);" value="预览" >
																  <input type="button" id="uploaddoc3"  onclick="SubForm(3);" value="上传" >
															 </div>		
														 </div>											 	                        	                                            
							                      </div>
							                    </li>
						                    </c:if>

 											<c:if test="${isShareholder}">
							                    <li class="media leftTab"  >
							                      <div class="media-body">
			 											<div class="row"> 				          
							          						 <div class="col-lg-4 col-md-12 col-12 col-sm-12">				                      
													              <div class="">Application of Shares</div> 
													         </div>     
							          						 <div class="col-lg-2 col-md-12 col-12 col-sm-12">												              										              										                				                       
															    <div class="btn-group btn-group-sm">
																    <button type="button" class="btn btn-default viewFile" onclick="previewDoc(4)">查看</button>
																    <button type="button" class="btn btn-default downloadFile" id="downloadDoc4">下载</button>
																</div>	
															 </div>		
							          						 <div class="col-lg-6 col-md-12 col-12 col-sm-12">		
																  <input type="file" id="myFile4" placeholder="Application of Shares"/>
																  <input type="button" class="btn btn-default viewFile" onclick="preview(4);" value="预览" >
																  <input type="button" id="uploaddoc4" onclick="SubForm(4);" value="上传" >
															 </div>	
														 </div>											 	                        	                                            
							                      </div>
							                    </li>				                    
						                    </c:if>

 											<c:if test="${isDirector || isShareholder}">
							                    <li class="media leftTab"  >
							                      <div class="media-body">
			 											<div class="row"> 				          
							          						 <div class="col-lg-4 col-md-12 col-12 col-sm-12">				                      
													              <div class="">Client Acceptance Form</div> 
													         </div>     
							          						 <div class="col-lg-2 col-md-12 col-12 col-sm-12">												              										              										                				                       
															    <div class="btn-group btn-group-sm">
																    <button type="button" class="btn btn-default viewFile" onclick="previewDoc(5)">查看</button>
																    <button type="button" class="btn btn-default downloadFile" id="downloadDoc5">下载</button>
																</div>	
															 </div>		
							          						 <div class="col-lg-6 col-md-12 col-12 col-sm-12">		
																  <input type="file" id="myFile5" placeholder="Client Acceptance Form"/>
																  <input type="button" class="btn btn-default viewFile" onclick="preview(5);" value="预览" >
																  <input type="button" id="uploaddoc5"  onclick="SubForm(5);" value="上传" >
															 </div>	
														 </div>											 	                        	                                            
							                      </div>
							                    </li>				                    
						                    </c:if>

											<c:if test="${isDirector || isNamedDirector}">
							                    <li class="media leftTab"  >
							                      <div class="media-body">
			 											<div class="row"> 				          
							          						 <div class="col-lg-4 col-md-12 col-12 col-sm-12">				                      
													              <div class="">Form 45 / 201</div> 
													         </div>     
							          						 <div class="col-lg-2 col-md-12 col-12 col-sm-12">												              										              										                				                       
															    <div class="btn-group btn-group-sm">
																    <button type="button" class="btn btn-default viewFile" onclick="previewDoc(6)">查看</button>
																    <button type="button" class="btn btn-default downloadFile" id="downloadDoc6">下载</button>
																</div>	
															 </div>		
							          						 <div class="col-lg-6 col-md-12 col-12 col-sm-12">		
																  <input type="file" id="myFile6" placeholder="Form 45 / 201"/>
																  <input type="button" class="btn btn-default viewFile" onclick="preview(6);" value="预览" >
																  <input type="button" id="uploaddoc6"  onclick="SubForm(6);" value="上传" >
															 </div>		
														 </div>											 	                        	                                            
							                      </div>
							                    </li>				                    
						                    </c:if>

											<c:if test="${isShareholder}">
							                    <li class="media leftTab"  >
							                      <div class="media-body">
			 											<div class="row"> 				          
							          						 <div class="col-lg-4 col-md-12 col-12 col-sm-12">				                      
													              <div class="">Share Certificate</div> 
													         </div>     
							          						 <div class="col-lg-2 col-md-12 col-12 col-sm-12">												              										              										                				                       
															    <div class="btn-group btn-group-sm">
																    <button type="button" class="btn btn-default viewFile" onclick="previewDoc(7)">查看</button>
																    <button type="button" class="btn btn-default downloadFile" id="downloadDoc7">下载</button>
																</div>	
															 </div>		
							          						<div class="col-lg-6 col-md-12 col-12 col-sm-12">		
																  <input type="file" id="myFile7" placeholder="Share Certificate"/>
																  <input type="button" class="btn btn-default viewFile" onclick="preview(7);" value="预览" >
																  <input type="button" id="uploaddoc7" onclick="SubForm(7);" value="上传" >
															 </div>	
														 </div>											 	                        	                                            
							                      </div>
							                    </li>				                    
						                    </c:if>

											<c:if test="${isShareholder && isNamedDirector || isNamedDirector}">
							                    <li class="media leftTab"  >
							                      <div class="media-body">
			 											<div class="row"> 				          
							          						 <div class="col-lg-4 col-md-12 col-12 col-sm-12">				                      
													              <div class="">Nominee's+Dir's+Authrn_Final</div> 
													         </div>     
							          						 <div class="col-lg-2 col-md-12 col-12 col-sm-12">												              										              										                				                       
															    <div class="btn-group btn-group-sm">
																    <button type="button" class="btn btn-default viewFile" onclick="previewDoc(8)">查看</button>
																    <button type="button" class="btn btn-default downloadFile" id="downloadDoc8">下载</button>
																</div>	
															 </div>		
							          						<div class="col-lg-6 col-md-12 col-12 col-sm-12">		
																  <input type="file" id="myFile8" placeholder="Nominee's Dir's Authrn Final"/>
																  <input type="button" class="btn btn-default viewFile" onclick="preview(8);" value="预览" >
																  <input type="button" id="uploaddoc8"  onclick="SubForm(8);" value="上传" >
															 </div>	
														 </div>											 	                        	                                            
							                      </div>
							                    </li>					                    
						                    </c:if>

						                  </ul> 
						                  <!--<div class="text-center pt-1 pb-1"><a id="download_all" href="#" class="btn btn-primary btn-sm btn-round">全部下载</a></div>    -->  
						              </div>
		
						            </div>	                    
		                    </div>
		
		                    <div class="clearfix"></div>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.228/pdf.min.js"></script>
  <!-- <script src="../../../assets/js/html2canvas.js"></script> -->
  <script src="../../../assets/js/stisla.js"></script>
  <!-- Template JS File -->
  <script src="../../../assets/js/scripts.js"></script>
  <script src="../../../assets/js/custom.js"></script>

  <script src="../../../assets/js/page/index-0.js"></script>
  <script src="../../../assets/js/onlineSignature.js"></script>
  <script src="../../../assets/js/signaturePad/signature_pad.umd.js"></script>
  <script src="../../../assets/js/signaturePad/app.js"></script>
</body>
</html>
