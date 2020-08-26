<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>睿信集团&mdash; 控制面版</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

  <!-- Template CSS -->
  <link rel="stylesheet" href="../../assets/css/style.css">
  <link rel="stylesheet" href="../../assets/css/components.css">
</head>

<body>
<jsp:include page="../menu.jsp" />
      <!-- Main Content -->
      <div class="main-content">
        <section class="section" id="onlineSignature">
          <div class="section-header">
            <h1>在线签名</h1>
          </div>    
          <div class="row">
            <div class="col-lg-4 col-md-12 col-12 col-sm-12">
              <div class="card">
                <div class="card-header">
                  <h4>待签名清单</h4>
                </div>
                <div class="card-body fixcardhieht">
                  <ul class="list-unstyled list-unstyled-border">
                  
                    <li class="media leftTab active"  id="b-1" onclick="viewPri(1)" onmouseover="viewPri(1)" >
                      <div class="media-body">
                        <div class="float-right list_btn">下载</div>
                        <div class="">First Director Meeting Resolution</div>                       
                      </div>
                    </li>
                    <li class="media leftTab active"  id="b-2" onclick="viewPri(2)" onmouseover="viewPri(2)" >
                      <div class="media-body">
                        <div class="float-right list_btn">下载</div>
                        <div class="">Secretary Agreement </div>                       
                      </div>
                    </li>
                    <li class="media leftTab active"  id="b-3" onclick="viewPri(3)" onmouseover="viewPri(3)" >
                      <div class="media-body">
                        <div class="float-right list_btn">下载</div>
                        <div class="">ANNEX B - Notice for Controllers</div>                       
                      </div>
                    </li>   
                    <li class="media leftTab active"  id="b-4" onclick="viewPri(4)" onmouseover="viewPri(4)" >
                      <div class="media-body">
                        <div class="float-right list_btn">下载</div>
                        <div class="">Application of Shares</div>                       
                      </div>
                    </li>
                     <li class="media leftTab active"  id="b-5" onclick="viewPri(5)" onmouseover="viewPri(5)" >
                      <div class="media-body">
                        <div class="float-right list_btn">下载</div>
                        <div class="">Client Acceptance Form</div>                       
                      </div>
                    </li>
                    <li class="media leftTab active"  id="b-6" onclick="viewPri(6)" onmouseover="viewPri(6)" >
                      <div class="media-body">
                        <div class="float-right list_btn">下载</div>
                        <div class="">Form 45 / 201</div>                       
                      </div>
                    </li>   
                    <li class="media leftTab active"  id="b-7" onclick="viewPri(7)" onmouseover="viewPri(7)" >
                      <div class="media-body">
                        <div class="float-right list_btn">下载</div>
                        <div class="">Share Certificate</div>                       
                      </div>
                    </li>
                  </ul>   
                  <div class="text-center pt-1 pb-1">
                    <a href="#" class="btn btn-primary btn-sm btn-round">
                      	全部下载
                    </a>
                  </div>                                                   
                </div>
              </div>
            </div>
            <div class="col-lg-8 col-md-12 col-12 col-sm-12">
               <div class="card priDesc"  id="b7" >
                <div class="card-header">
                  <h4>最近通告标题7</h4>
                  <div class="card-header-action">
                    <div class="btn-group">                    
                      <a  class="btn btn-primary">日期</a>
                    </div>
                  </div>
                </div>
                <div class="card-body fixcardhieht">
                     <div class="media-title">段落标题</div>
                     <span class="text-small text-muted">内容展示：Cras sit amet nibh ls sit amet nibh libero, in gras sit amet nibh libero, in graibero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>                					   					   
                </div>
              </div>           
                <div class="card priDesc"  id="b6" >
                <div class="card-header">
                  <h4>最近通告标题6</h4>
                  <div class="card-header-action">
                    <div class="btn-group">                    
                      <a  class="btn btn-primary">日期</a>
                    </div>
                  </div>
                </div>
                <div class="card-body fixcardhieht">
                     <div class="media-title">段落标题</div>
                     <span class="text-small text-muted">内容展示：Cras sit amet nibh ls sit amet nibh libero, in gras sit amet nibh libero, in graibero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>                					   					   
                </div>
              </div>          
               <div class="card priDesc"  id="b5" >
                <div class="card-header">
                  <h4>最近通告标题5</h4>
                  <div class="card-header-action">
                    <div class="btn-group">                    
                      <a  class="btn btn-primary">日期</a>
                    </div>
                  </div>
                </div>
                <div class="card-body fixcardhieht">
                     <div class="media-title">段落标题</div>
                     <span class="text-small text-muted">内容展示：Cras sit amet nibh ls sit amet nibh libero, in gras sit amet nibh libero, in graibero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>                					   					   
                </div>
              </div>           
              <div class="card priDesc"  id="b4" >
                <div class="card-header">
                  <h4>最近通告标题4444</h4>
                  <div class="card-header-action">
                    <div class="btn-group">                    
                      <a  class="btn btn-primary">日期</a>
                    </div>
                  </div>
                </div>
                <div class="card-body fixcardhieht">
                     <div class="media-title">段落标题</div>
                     <span class="text-small text-muted">内容展示：Cras sit amet nibh ls sit amet nibh libero, in gras sit amet nibh libero, in graibero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>                					   					   
                </div>
              </div>
              <div class="card priDesc"  id="b3" >
                <div class="card-header">
                  <h4>最近通告标题333</h4>
                  <div class="card-header-action">
                    <div class="btn-group">                    
                      <a  class="btn btn-primary">日期</a>
                    </div>
                  </div>
                </div>
                <div class="card-body fixcardhieht">
                     <div class="media-title">段落标题</div>
                     <span class="text-small text-muted">内容展示：Cras sit amet nibh s sit amet nibh libero, in gras sit amet nibh libero, in gras sit amet nibh libero, in gralibero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>                					   					   
                </div>
              </div>  
              <div class="card priDesc"  id="b2" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht s_content_sty">
                     <h4><b>Secretary Agreement </b></h4><br/>
                     <div class="media-content">
                    	 <p class="text_signfile">Date: Signing Date</p>    
                    	 <p class="text_signfile">日期：签署日期</p>         
                     	 <p class="text_signfile">To:	Rsin Group Pte. Ltd. Re:	Services</p> 
                    	 <p class="text_signfile">致：  Rsin Group Pte. Ltd.关于：  服务</p>    
                    	 <p class="text_signfile"> Agreement (this “Agreement”) </p> 
						 <p class="text_signfile">协议（本“协议”）</p> 						
						 <p class="text_signfile"><span>Proposed Name of Company: COMPANY NAME PTE. LTD. (the “Company”) I/We, <br/>the undersigned hereby agree as follows to:</span></p> 
						 <p class="text_signfile">拟定公司名称：XX私人有限公司（以下简称“公司”），我/我们，签字人在此同意以下：</p> 
						 <br/>
						 <div class="row text_no_di2">
							<div class="col-md-2 col-sm-2"> 
								<p class="text_signfile">1.</p> 
               		 		</div>		
							<div class="col-md-10 col-sm-10"> 
								<p class="text_signfile">
								<span>COMPANY NAME PTE. LTD. appoint Rsin Group Pte. Ltd. & related companies to provide us with one or more of the following services: incorporation of a company in Singapore, corporate secretarial services, employment pass application, financial statement compilation and filing, tax computation and filing.</span><br/>
								<span>XX私人有限公司指定Rsin Group Pte. Ltd.及相关公司为我们提供以下一项或多项服务：在新加坡成立公司、公司秘书服务、就业证申请、财务报表编制和归档、税务计算和备案。</span></p> 
               		 		</div>	               		 						 
						 </div>
						 <div class="row text_no_di2">
							<div class="col-md-2 col-sm-2"> 
								<p class="text_signfile">2.</p> 
               		 		</div>		
							<div class="col-md-10 col-sm-10"> 
								<p class="text_signfile">
								<span>
									COMPANY NAME PTE. LTD. consent to act as a director of the Company of name as proposed. We agree and acknowledge that the proposed name is subject to approval by the relevant authorities in Singapore (including but not limited to the Accounting and Corporate Regulatory Authority (“ACRA”)) and there is no guarantee that the proposed name will be approved by the relevant authorities. In the event that the proposed name is not approved, we agree to work with Rsin Group Pte. Ltd. & related companies & related companies to resolve this issue with the relevant authorities.</span><br/>
								<span>
									XX私人有限公司同意担任拟定名字的公司董事。我们同意并了解，拟定名称须经新加坡相关当局（包括但不限于会计与企业监管局（“ACRA”）的批准），且不能保证提议的名称将获得相关当局的批准。如果提议的名称未获批准，我们同意与Rsin Group Pte. Ltd.和相关公司合作，与相关当局解决该问题。
								</span>
								</p> 
               		 		</div>	               		 						 
						 </div>		

						 
			                   	                   	                    	                	             					   					   
               		 </div>
                </div>
              </div>              
              <div class="card priDesc view"  id="b1" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>First Director Meeting Resolution</b></h4><br/>
                     <div class="media-content">
                    	 <p class="text_signfile text_centre">COMPANY NAME PTE. LTD.</p>    
                    	 <p class="text_signfile text_centre">XX私人有限公司</p>         
                     	 <p class="text_signfile text_centre">(INCORPORATED IN THE REPUBLIC OF SINGAPORE)</p> 
                    	 <p class="text_signfile text_centre">（在新加坡共和国注册成立）</p>    
                    	 <p class="text_signfile">MINUTES OF THE FIRST BOARD OF DIRECTORS MEETING OF THE COMPANY </p> 
						 <p class="text_signfile">公司第一届董事会会议记录</p> 
						 <p class="text_signfile text_centre">AGENDA</p> 
						 <p class="text_signfile text_centre">会议议程</p> 
						 <div class="row text_di2">
							<div class="col-md-2 col-sm-2"> 
								<p class="text_signfile">BOD 1</p> 
               		 		</div>		
							<div class="col-md-10 col-sm-10"> 
								<p class="text_signfile">
								<span>ALLOTMENT OF ADDITIONAL SHARES</span><br/> 
								<span>分发额外股份</span><br/> 
								<span>Subject to authority being given under section 161 of the Companies Act (Cap.
									50), new additional shares, be and are hereby allotted for cash, and that the Common Seal of the Company be affixed the share certificate to be issued in accordance with the Constitution of the Company.
									</span><br/>
								<span>根据《公司法》（第50章）第161节,新增发股份，特此以现金方式配发，并在根据公司章程签发的股份证书上加盖公司公章。</span></p> 
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
								<span>
									公司注册证书和公司章程
								</span><br/> 
								<span>
									It be noted that the company was incorporated as per ACRA Bizfile and that the Registration Number assigned to it as per ACRA Bizfile. The Notice of Incorporation was tabled together with a copy of the Constitution of the Company.
								</span><br/>
								<span>
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
									FIRST DIRECTORS
								</span><br/> 
								<span>
									第一任董事
								</span><br/> 
								<span>
									It was resolved that the following persons stated in ACRA Bizfile profile be confirmed as First Directors of the Company retrospective from the date of incorporation of the Company.
								</span><br/>
								<span>
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
									REGISTERED OFFICE
								</span><br/> 
								<span>
									注册地址
								</span><br/> 
								<span>
									It was resolved that the situation of the Company’s Registered Office at 111 NORTH BRIDGE ROAD #29-06A PENINSULA PLAZA S179098 retrospective from the date of incorporation to be confirmed.
								</span><br/>
								<span>
									经决议，公司注册办公地址位于111 NORTH BRIDGE ROAD#29-06A PENINSULA PLAZA S179098，自公司成立之日起予以确认。
								</span>
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
									FINANCIAL YEAR END
								</span><br/> 
								<span>
									财务年结日
								</span><br/> 
								<span>
									It was resolved that the first financial period of the Company be made up for the period from the date of incorporation to the last day of the 11th month since incorporation and that the subsequent financial year end will be the same  annually until otherwise decided.
								</span><br/>
								<span>
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
								<span>
									ALLOTMENT AND ISSUE OF SHARES
								</span><br/> 
								<span>
									股份配发
								</span><br/> 
								<span>
									It was resolved that the signatories to the Memorandum be registered as members in respect of the shares which are subscribed at an issue price of SGD $1 per share namely:									
								</span><br/>
								<span>
									经决议，以下人员为股东，股份以每股1新元的发行价格认购，即：
								</span><br/> 
								<span>
									SHAREHOLDER 1,
								</span>
								<span>
									2500
								</span>								
								<br/> 								
								<span>
									SHAREHOLDER 2,
								</span>
								<span>
									2500
								</span>								
								<br/> 											
								<span>
									Total:
								</span>
								<span>
									5000
								</span>								
								<br/> 								
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
									DISPENSING WITH DIRECTOR MEETING
								</span><br/> 
								<span>
									免除董事会会议
								</span><br/> 
								<span>
									Resolved that pursuant to the provision of the Companies Act, Cap 50, the company hereby dispenses with the holding of first director meetings and all subsequent director meeting, and that this resolution shall remain in full force and effect until otherwise resolved by shareholders or overridden by the operation of any provision of the Companies Act, Cap 50. Therefore while this resolution remains in force, matters which would normally be put before the director when they meet to hold the Meeting, shall instead be circulated to the directors and resolved by written means.									
								</span><br/>
								<span>
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
								<span>
									CONCLUSION
								</span><br/> 
								<span>
									结论
								</span><br/> 
								<span>
									There being no other business, the meeting was ended.
								</span><br/>
								<span>
									没有其它事务，会议结束了。
								</span>
								</p> 
               		 		</div>	              		 		               		 						 
						 </div>		
						 <p class="text_signfile">SIGNED AS A CORRECT RECORD</p> 				 
						 <p class="text_signfile">作为正确记录签字</p> 	
					    	<br/><br/><br/><br/><br/><br/>	
						 <p class="text_signfile">DIRECTOR 董事</p> 				 
						 <p class="text_signfile">Dated this Signing Date日期</p> 				                   	                   	                    	                	             					   					   
               		 </div>
                </div>
              </div>              
                                                      
            </div>
            <div class="col-lg-12 col-md-12 col-12 col-sm-12" id="signdiv">
              <div class="card">
                <div class="card-header">
                  <h4>请选择签名方式</h4>
                </div>
                  <div class="card-body fixcardhieht"> 
					 <div class="tab">
					  <button class="tablinks" onclick="openCity(event, 'onlineSign')">在线签名</button>
					  <button class="tablinks" onclick="openCity(event, 'OfflineSign')">线下签名</button>
					 </div>
                     <br/>
 					<div id="onlineSign" style="display:none;" class="tabcontent">                    
	                     <div class="custom-control custom-checkbox">
	                        <input type="checkbox" class="custom-control-input" id="customCheck1">
	                        <label class="custom-control-label" for="customCheck1">我选择在线签名，我已阅读并接受以上文件内容，同意签名确认。</label>
	                    </div> 
						<div class="form-group row">
							<textarea class="form-control textareaheight signaturediv"
										id="signaturediv" placeholder="请在此处签名" >
							</textarea>										
						</div>	  
	                    <div class="buttons sign_btn">                    
	                      <a href="#" class="btn btn-icon icon-left btn-primary"><i class="fas fa-check"></i> 提交</a>
	                      <a class="btn btn-icon icon-left btn-secondary" onclick="delete()"><i class="fas fa-times"></i>清空</a>
	                    </div>						
                     <br/><br/>
	                     <div class="">	                        
	                        <label class=" ">请查看或者下载签名文件：</label>
	                    </div> 	                    
					</div>                    
 					<div id="OfflineSign" style="display:none;"  class="tabcontent">                    
	                     <div class="">
	                        <label class="">选择线下签名，请下载所有待签名文件，签名后进行扫描上传至以下表格中。</label>
	                    </div>   
					     <ul class="list-unstyled list-unstyled-border">                 
		                    <li class="media leftTab active"  id="b-1" onclick="viewPri(1)" onmouseover="viewPri(1)" >
		                      <div class="media-body">
		                        <div class="float-right list_btn">
		                        	<input type="file" class="form-control" id="uploadpassport1" placeholder="资料上传">
		                        </div>
		                        <div class="">First Director Meeting Resolution</div>                       
		                      </div>		                              		                      
		                    </li>
		                    <li class="media leftTab active"  id="b-2" onclick="viewPri(2)" onmouseover="viewPri(2)" >
		                      <div class="media-body">
		                        <div class="float-right list_btn"><input type="file" class="form-control" id="uploadpassport1" placeholder="资料上传"></div>
		                        <div class="">Secretary Agreement </div>                       
		                      </div>
		                    </li>
		                    <li class="media leftTab active"  id="b-3" onclick="viewPri(3)" onmouseover="viewPri(3)" >
		                      <div class="media-body">
		                        <div class="float-right list_btn"><input type="file" class="form-control" id="uploadpassport1" placeholder="资料上传"></div>
		                        <div class="">ANNEX B - Notice for Controllers</div>                       
		                      </div>
		                    </li>   
		                    <li class="media leftTab active"  id="b-4" onclick="viewPri(4)" onmouseover="viewPri(4)" >
		                      <div class="media-body">
		                        <div class="float-right list_btn"><input type="file" class="form-control" id="uploadpassport1" placeholder="资料上传"></div>
		                        <div class="">Application of Shares</div>                       
		                      </div>
		                    </li>
		                     <li class="media leftTab active"  id="b-5" onclick="viewPri(5)" onmouseover="viewPri(5)" >
		                      <div class="media-body">
		                        <div class="float-right list_btn"><input type="file" class="form-control" id="uploadpassport1" placeholder="资料上传"></div>
		                        <div class="">Client Acceptance Form</div>                       
		                      </div>
		                    </li>
		                    <li class="media leftTab active"  id="b-6" onclick="viewPri(6)" onmouseover="viewPri(6)" >
		                      <div class="media-body">
		                        <div class="float-right list_btn"><input type="file" class="form-control" id="uploadpassport1" placeholder="资料上传"></div>
		                        <div class="">Form 45 / 201</div>                       
		                      </div>
		                    </li>   
		                    <li class="media leftTab active"  id="b-7" onclick="viewPri(7)" onmouseover="viewPri(7)" >
		                      <div class="media-body">
		                        <div class="float-right list_btn"><input type="file" class="form-control" id="uploadpassport1" placeholder="资料上传"></div>
		                        <div class="">Share Certificate</div>                       
		                      </div>
		                    </li>
                  		</ul>   
                     <br/><br/>                    
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
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../assets/js/stisla.js"></script>

  <!-- JS Libraies -->
  <script src="../node_modules/simpleweather/jquery.simpleWeather.min.js"></script>
  <script src="../node_modules/chart.js/dist/Chart.min.js"></script>
  <script src="../node_modules/jqvmap/dist/jquery.vmap.min.js"></script>
  <script src="../node_modules/jqvmap/dist/maps/jquery.vmap.world.js"></script>
  <script src="../node_modules/summernote/dist/summernote-bs4.js"></script>
  <script src="../node_modules/chocolat/dist/js/jquery.chocolat.min.js"></script>

  <!-- Template JS File -->
  <script src="../assets/js/scripts.js"></script>
  <script src="../assets/js/custom.js"></script>

  <!-- Page Specific JS File -->
  <script src="../assets/js/page/index-0.js"></script>
  
  <script type="text/javascript">    
        function viewPri(x) {
            document.getElementsByClassName("leftTab active")[0].classList.remove("active");
            document.getElementsByClassName("priDesc view")[0].classList.remove("view");
            document.getElementById("b-" + x).classList.add("active");
            document.getElementById("b" + x).classList.add("view");
           /* document.getElementById("rightImgPri").src = "images/abroad/ca/Primary/sc/Ontario/fprivate" + x + ".jpg";*/
        }

        function openCity(evt, cityName) {
          var i, tabcontent, tablinks;
          tabcontent = document.getElementsByClassName("tabcontent");
          for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
          }
          tablinks = document.getElementsByClassName("tablinks");
          for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
          }
          document.getElementById(cityName).style.display = "block";
          evt.currentTarget.className += " active";
        }

	</script>
</body>
</html>
