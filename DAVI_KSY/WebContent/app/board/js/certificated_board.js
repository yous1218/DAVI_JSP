var certificatedNum = 3;

var check = true;

   function getList(){
            $.ajax({
               url : contextPath + "/board/ceritificatedBoardAjax.bo?certificatedNum=" + certificatedNum,
               //data: {'certificatedNum': certificatedNum},
               type : "get",
               dataType : "json",
			   //async : false,
               success : showList
            });
			console.log(certificatedNum);
         }
      var num = 1;
       function showList(pages){         
          var text = "";
          if(pages != null && pages.length != 0){
             $.each(pages, function(index, page){   
                
                text += '<div class="certificated_box" style="height: auto; margin-top: 20px; border-bottom: none;">' ;
                text += '<!-- 작성자 -->' +
                          '<div style="display : flex; justify-content: center; height: auto;">' +
                          '<div style="width:10%;">' +
                          '<img id="" name="" class="profile" src="' + contextPath + '/images/logo_blue.png" alt=""' + 
                          'style="margin:5px; width: 35px; height: 35px;cursor: pointer;" onclick="#"/> <!-- 프로필 사진 클릭시 해당 계정으로 이동 -->' +
                          '</div><div id="" style="width:10%; padding-top: 10px; margin-left: 5px;">' + page.memberId + '</div>' +
                          '<div class="icon_color" style="display: flex; justify-content: flex-end; width:80%; padding-top: 10px; padding-right: 10px;">';
                           if(sessionId == page.memberId){
                              text += '<div id="menuHover"><i class="fas fa-ellipsis-h" onclick="#" style="cursor: pointer;"></i>' +              
                              '<ul id="sub-menu" style="display: flex;flex-direction: column;">' +
                              '<li><a href="javascript:modifyPopup(' + page.certificatedNum +','+ page.certificatedTitle + ',' + page.certificatedContent + ',' + 
                                 page.certificatedPath + ')" type="button">수정</a></li>' +
                              '<li><a href="' + contextPath + '/board/certificateDeleteOk.bo?certificatedNum=' + page.certificatedNum + '" type="button">삭제</a></li></ul></div> ';             
                           }
                             
                 text +=   '</div></div>   <!-- 게시판 제목 -->' +                     
                           '<div style="height: 30px; padding-top: 5px; margin:5px;"><h4>' + page.certificatedTitle + '</h4></div>';
                            
                text += '<div style="width: 70%; margin: 3% auto;">' +
                '<div style="position:relative; width:100%; height: 0; padding-bottom:100%; ">' +
                '<img src="'+page.certificatedFilePath+'" style="display:inline-block; width:100%;' + 
                'height:100%; position:absolute; top:0; left:0; z-index:-1">' +
                '<img id="likeMark_'+page.certificatedNum+'" src="'+contextPath+'/images/logo_blue.png" style="display:none; width:100%; margin-top:10%"></div></div>' ;

                text += '<div class="icon_color" style="display : flex; justify-content: flex-start; height: 35px; padding: 5px;">';
                if(page.certificatedlikeCheck == true){
                   text += '<div id="checkedDiamond_'+page.certificatedNum+'" style="font-size: 1.2rem; padding-top: 2px; color:#0038fb;"' + 
                         'onclick="unchangeDiamond('+page.certificatedNum+')">' +
                         '<i class="fas fa-gem fa-lg" style="cursor: pointer; " ></i></div>' +
                         '<div id="diamond_'+ page.certificatedNum+'" style="font-size: 1.2rem; padding-top: 2px; display : none;"' +
                         'onclick="changeDiamond('+page.certificatedNum+')">' +
                         '<i  class="far fa-gem fa-lg" style="cursor: pointer;" ></i></div>';
                }else{
                   text += '<div id="checkedDiamond_'+page.certificatedNum+'" style="font-size: 1.2rem; padding-top: 2px; color:#0038fb;' +
                         'display : none;" onclick="unchangeDiamond('+page.certificatedNum+')">' +
                         '<i class="fas fa-gem fa-lg" style="cursor: pointer; " ></i></div>' +
                         '<div id="diamond_'+page.certificatedNum+'" style="font-size: 1.2rem; padding-top: 2px;"' +
                         'onclick="changeDiamond('+page.certificatedNum+')">' +
                         '<i  class="far fa-gem fa-lg" style="cursor: pointer;" ></i></div>' ;
                }   
               
              text += '<div style="font-size: 1.3rem;" onclick ="changeComment('+page.certificatedNum+')">'+
                          '<i id="replyIcon_'+page.certificatedNum+'" class="far fa-comment fa-lg" style="cursor: pointer; margin-left: 9px;"></i></div></div>';
                        
                  text += '<div style="display : flex; justify-content: flex-start; height: 30px; padding: 5px;">'+
                          '<div>좋아요&nbsp;</div><div class ="icon_color" id="diamond_num_'+page.certificatedNum+'" style="color:#0038fb;">'+page.certificatedlikeCnt+'</div>' +
                          '<div>개</div></div>';
                  
                  text += '<div style="display : flex; justify-content: flex-start; height: auto; padding: 5px;">'+
                          '<div id="" style="width: 20%;">'+page.memberId+'</div>' +
                          '<div id="mainPreview_'+page.certificatedNum+'" style="width: 70%;">'+page.certificatedContentMini+'</div>' +
                          '<div class="certificated_textarea" id="mainDetail_'+page.certificatedNum+'" style="display: none;'+
                    'height: auto; border-bottom: none; width:70%;">'+page.certificatedContent+'</div>';
                        
                        
              text += '<div id="iconPlus_'+page.certificatedNum+'" style="width: 10%; text-align: right; margin: 0 5px;' + 
                    'cursor: pointer;"onclick="mainDetail('+page.certificatedNum+')">' + 
                          '<i id="" class="far fa-plus-square icon_color"></i></div></div>';
                

              text += '<div id="ajaxFunction">' +
               '<input id="reply_'+index+'" type="hidden" value="'+page.certificatedNum+'">'+
               '<div id ="replyAjaxDiv_'+page.certificatedNum+'_mini" style="background-color: aliceblue; padding:0 0.5em;margin: 0 -0.5em;font-size: 0.9em;"></div>';

               text += '<div id = "replyAjaxDiv_'+page.certificatedNum+'" style="display : none;background-color: aliceblue; padding:0 0.5em;margin: 0 -0.5em;font-size: 0.9em;"></div></div>';
      
               text += '<div style="padding: 5px; margin-top:1%; color: rgba(164, 167, 170, 1);font-size: 0.8em;">';
               text +=  page.certificatedTime +'</div></div><div style="border-top : 1px solid rgba(164, 167, 170, 0.3);)"></div>';
      
               text += '<div style="display : flex; justify-content: flex-start; height: auto; padding: 5px; border: 1px solid rgba(164, 167, 170, 0.3); border-top : none;" >';
      
               text += '<div style="width: 20%; padding-top: 5px; display:flex; align-items:center; padding:5px;">'+sessionId+'</div>';
               text += '<input id="replyContents_'+page.certificatedNum+'" type="text" placeholder="댓글을 작성해주세요" style="width:70%; border:0; border-bottom: none;"/>';
               text += '<input type="button" value="등록" style="width:10%; margin: 0 5px; box-shadow: none; color: rgba(0, 59, 251, 0.3)!important"'+ 
                        'onclick="javascript:writeReply('+page.certificatedNum+','+'\''+sessionId+'\''+')"></div>';
                    getReplyList(page.certificatedNum);
					console.log(page.certificatedlikeCnt);
                
             });
          }
          //새로운 요소 만들어서 값넣고 끝에 추가하기
          var newDIV = document.createElement("div");
          newDIV.innerHTML = text;
          document.getElementById("listAJAX").appendChild(newDIV); 
          newDIV.classList.add("animation-init");
          setTimeout(function(){
        	  newDIV.classList.add("animation-fade");
          },30);
          check = true;
          certificatedNum = certificatedNum +2;         
       } 
       
       $(window).scroll(function(){
          var div = document.getElementById('scrollDiv');
          var winH = window.innerHeight;
          var postFromBottom = div.getBoundingClientRect().bottom;
          if(winH > postFromBottom){
             if(check){
                check = false;
               /* setTimeout(function(){
                   getList();
                },500);*/
                getList();
             }
          }
       });
       
       
      var diamondCheck = false; 
       
       function changeDiamond(num) {
          var diamond = $("#diamond_" + num);
          var checkedDiamond = $("#checkedDiamond_" + num);
          var likeMarkDiamond = $("img#likeMark_"+num);
          
         diamond.css('display', 'none');
         checkedDiamond.css('display','');
         diamondCheck = true;
         likeMarkDiamond.fadeIn(500);
         likeMarkDiamond.fadeOut(500);
         /*var id = sessionStorage.getItem("session_id");*/
         var id = sessionId;         
         $.ajax({
            url: contextPath + "/board/ceritificatedBoardLikeOk.bo?memberId="+ id +"&certificatedNum=" + num + "&likeCheck=1" ,
            type : "get",	
            dataType : "text",
			//async : false,
            success : function(result){
               $("#diamond_num_" + num ).text(result.trim());
            }   
         });
      }
      
      function unchangeDiamond(num){
         var diamond = $("#diamond_" + num);
          var checkedDiamond = $("#checkedDiamond_" + num);
         var likeMarkDiamond = $("img#likeMark");
         
         diamond.css('display','');
         checkedDiamond.css('display', 'none');
         diamondCheck = false;
         var id = sessionId;
         $.ajax({
            url: contextPath + "/board/ceritificatedBoardLikeOk.bo?memberId="+ id +"&certificatedNum=" + num + "&likeCheck=0",
            type : "get",
            dataType : "text",
			//async : false,
            success : function(result){
               $("#diamond_num_" + num).text(result.trim());
            }      
         });
         
      }
       
       