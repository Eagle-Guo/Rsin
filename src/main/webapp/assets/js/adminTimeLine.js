$(document).ready(function() {
	$("#startDate").attr("value", new Date(new Date().setFullYear(new Date().getFullYear() + 1)).toISOString().slice(0, 10));
	$("#startDate").attr("min", new Date().toISOString().slice(0, 10));
	
	var allA = document.getElementsByTagName("a");
    for (var i = 0; i < allA.length; i++) {
        allA[i].onclick = delA;
    }
    var addEmpButton = document.getElementById("addEmpButton");
    addEmpButton.onclick = function () {
        var service = document.getElementById("service").value;
        var registerDate = document.getElementById("registerDate").value;            	
        var ServiceCycle = document.getElementById("ServiceCycle").value;
        var serviceTimes = document.getElementById("serviceTimes").value;
        var startDate = document.getElementById("startDate").value;
        var actualDate = document.getElementById("startDate");
        
        for (var i = 0; i < serviceTimes; i++) {
        	var tr = document.createElement("tr");
            tr.innerHTML="<td  colspan='2' scope='col'>"+startDate+"</td>"+
    		                `<td>
    							<div class='form-group'>
    								<input type='date' class='form-control' id='startDate'>
    							</div>
    						</td>` +
    						`<td>										                          
    							<div class='form-check'>
    									<input class='form-check-input' type='checkbox' id='defaultCheck1'>
    											<label class='form-check-label' for='defaultCheck1'>
    													 已完成
    											</label>
    							</div>
    						</td>`+
    						`<td>
    							<div class='form-group'>
    									<input type='text' class='form-control'>
    							</div>
    						</td>`+
                            "<td><a href='javascript:;'>删除此记录</a></td>" ;
            var a=tr.getElementsByTagName("a")[0];
            a.onclick=delA;
            var recordTable = document.getElementById("recordTable");
            var tbody = recordTable.getElementsByTagName("tbody")[0];
            tbody.appendChild(tr);
        }
        
    };
});
//TEST

        function delA() {
            var tr = this.parentNode.parentNode;
            var name = tr.children[0].innerHTML;
            var flag = confirm("确定" + name + "删除吗？");
            if (flag) {
                tr.parentNode.removeChild(tr);
            }
            return false;
        };




//add record
function addTimeLineRecord() {
  var record = document.createElement("tr");
  record.innerHTML = `
          <div id="defaultparent"><div id="defaultchild"><th scope="row">年审</th>
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
          <button onclick="removeTimeLineRecord()"> 删除此记录</button>							                          
              <!--<div class="form-check">
                <input class="form-check-input" type="checkbox" id="defaultCheck2" onclick="removeTimeLineRecord()">
                <label class="form-check-label" for="defaultCheck2">
              			  删除此记录
                </label>
              </div>-->
          </td>	</div></div>
        `;
		var element=document.getElementById("timeLineRecord1");
		element.appendChild(record);
}



//remove record
function removeTimeLineRecord() {
	var parent=document.getElementById("defaultparent");
	var child=document.getElementById("defaultchild");
	parent.removeChild(child);
}


//

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


//Get the modal
var modal = document.getElementById("myModal");

//Get the button that opens the modal
var btn = document.getElementById("myBtn");

//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

//When the user clicks the button, open the modal 
btn.onclick = function() {
modal.style.display = "block";
}

//When the user clicks on <span> (x), close the modal
span.onclick = function() {
modal.style.display = "none";
}

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
if (event.target == modal) {
  modal.style.display = "none";
}
}
