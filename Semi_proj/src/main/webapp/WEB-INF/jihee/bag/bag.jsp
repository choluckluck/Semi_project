<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%
    String ctxPath = request.getContextPath();
    //     /MyMVC
%>  
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<style type="text/css">

   thead#notice_thead{
      border: none; 
   }
   
   th[name='notice_th']{
      font-weight: normal;
   }
   
   ul {
      list-style:none
   }
   
   a:link {
     color : black;
   }

   a:hover {
     color : black;
   }
   a:active {
     color : green
   }
   
   img#likeimg {
     width: 100px;
     height: 120px;
     object-fit: cover;
   }
   
</style>

<script>
   $(document).ready(function(){
      <%-- //선택상품 주문 클릭시
      $("button#orderSelect").click(function(){
         const frm = document.bag_form;
         frm.action="<%= ctxPath%>/product/productNew.up";
         frm.method = "get";
         frm.submit();
      });
    --%>
    
    /*
    data-prodcode="${cvo.cart_code}" data-prodname="${cvo.prod.prod_name}" data-prodcolor="${cvo.fk_prod_color}" data-prodsize="${cvo.fk_prod_size}"
    */
    
    var data_prod_code="";
    var data_prod_name="";
    var data_prod_color="";
    var data_prod_size="";
    var data_cart_code="";
    $("#cartoptionModal").on('show.bs.modal',function(e){
         $("#cartmodal_colorselect").empty();
         
         data_prod_code = $(e.relatedTarget).data('prodcode');
         data_prod_name = $(e.relatedTarget).data('prodname');
         data_prod_color = $(e.relatedTarget).data('prodcolor');
         data_prod_size = $(e.relatedTarget).data('prodsize');
         data_cart_code = $(e.relatedTarget).data('cartcode');
         
         console.log(data_prod_size);
         
         $("#cartmodal_prod_name").text(data_prod_name);
         $("#cartmodal_prod_color").text(data_prod_color);
         $("#cartmodal_prod_size").text(data_prod_size);
         $("#cartmodal_prod_code").val(data_prod_code);
         $("#cartmodal_cart_code").val(data_cart_code);
         
         //컬러를 알아오는 에이젝스함수
         getColor(data_prod_code, data_prod_color);
         //사이즈를 알아오는 에이젝스함수
         getSize(data_prod_code, data_prod_size);
         
         //컬러셀렉트 변경 이벤트 => 해당 사이즈를 알아온다
         $("#cartmodal_colorselect").change(function(event){
            $("#cartmodal_sizeselect").empty();
            getSize(data_prod_code);
            
            $("#cartmodal_sizeselect:eq(0)").prop("selected",true);
         });
         
         //옵션변경버튼 클릭이벤트
         $("#cartmodal_optionupdate").off('click').on('click',function(evnet){
            event.stopPropagation();
            const updateconfirm = confirm("옵션을 변경하시겠습니까?");
            if(updateconfirm){
               updateCartOption(data_cart_code);
            }            
         });
         
         
   });//end of modal event
    
   
     $("li[name='shname']").click(function(){
         const frm = document.bag_form;
         frm.action="<%= ctxPath%>/product/productNew.up";
         frm.method = "get";
         frm.submit();
      });
     
     
     //공지사항 클릭 이벤트
     $("div#notice_text").click(function(){
        location.href="<%= ctxPath%>/community/notice.up";
     });
     
     
     // 타이틀 => 게시글 클릭이벤트
     $("tbody > tr > td:nth-child(2)").click(function(){
        
     });
     
  
  });//$(document).ready(function(){})------

  
  function allCheckBox() {
	   
      var bool = $("#allCheckOrNone").is(":checked");
      /*
         $("#allCheckOrNone").is(":checked"); 은
           선택자 $("#allCheckOrNone") 이 체크되어지면 true를 나타내고,
           선택자 $("#allCheckOrNone") 이 체크가 해제되어지면 false를 나타내어주는 것이다.
      */
      
      $(".chkboxpnum").prop("checked", bool);
   }// end of function allCheckBox()-------------------------
   
   
//모달창 컬러를 알아오는 에이젝스함수
function getColor(updateProdcode, selectedColor){

   $.ajax({
         url : "<%=request.getContextPath() %>/jihee/bag/getMordaloptionColor.sue",
         type : "get",
         data:{"pcode":updateProdcode},
         async: false,
         dataType:"JSON",
         success:function(json){
            
            var colorhtml = '';
            $.each(json, function(index, item){
               colorhtml += '<option>'+item.pcolor+'</option>';
            });//end of $.each
            
            //colorselect창에 option을 더해준다
            $("#cartmodal_colorselect").append(colorhtml);
            $("#cartmodal_colorselect").val(selectedColor);
            
            
         },
      error: function(request, status, error){
         alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }
       
    });//end of ajax
}//end of getColor

//모달창의 사이즈를 알아오는 에이젝스 함수
function getSize(updateProdcode, selectedSize){
   
   updateProdcolor = $("#cartmodal_colorselect").val();
   
   $.ajax({
      url : "<%=request.getContextPath()%>/hyerin/admin/adminProductListSizeJson.sue",
      type: "get",
      data:{"pcode":updateProdcode,
           "pcolor":updateProdcolor},
      dataType:"JSON",
      success:function(json2){
         
         if(json2.length > 0){

            var sizehtml = '';
            $.each(json2, function(index, item){
               if(index == 0){
                  sizehtml += '<option>'+item.psize+'</option>';
               }
               else{
                  sizehtml += '<option>'+item.psize+'</option>';
               }
            });//end of $.each
            
            // 해당 컬러의 사이즈 옵션값을 넣어준다
            $("#cartmodal_sizeselect").html(sizehtml);
            if(selectedSize != null){
               $("#cartmodal_sizeselect").val(selectedSize).prop("checked",true);
            }
            //$("#cartmodal_sizeselect").val(selectedSize);
            
         }
         
      },
      error: function(request, status, error){
         alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      } 
   });// end of ajax
   
}//end of getSize



//해당 카트의 옵션을 변경해주는 이벤트
function updateCartOption(updateCartcode){
   
   const updateColor = $("#cartmodal_colorselect").val();
   const updateSize = $("#cartmodal_sizeselect").val();
   
   $.ajax({
      url : "<%=request.getContextPath()%>/jihee/bag/updateCartOption.sue",
      type: "get",
      data:{"cart_code":updateCartcode,
           "fk_prod_color":updateColor,
           "fk_prod_size":updateSize},
      dataType:"JSON",
      success:function(json3){
         if(json3.updateCartResult == 1){
            alert("옵션이 변경되었습니다.");
            
            $("#cartoptionModal").modal("hide");
            location.href = "javascript:history.go(0)";
         }
      },
      error: function(request, status, error){
         alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
      }
   });// end of ajax
};//end updateCartOption
   
   
   //관심상품에 담고 장바구니에서는 없애주기 
   function goHide() {
      alert("확인용");
      };
      
  //관심상품에 담고 장바구니에서는 없애주기 
    function goDelete() {
       alert("선택하신상품을 삭제하시겠습니까?");
       };
      
     //상세페이지로 이동
    function goDetail() {
       alert("확인용");
       
    }

     
    function goOqtyEdit_plus (obj){
        
        const index = $("button.updateBtn_plus").index(obj);
        //alert(index);
        
        //수정해야 할 장바구니번호
        const cartno = $("input.cartno").eq(index).val();
        //alert("장바구니 번호 : " + cartno);
        
        //수정해야 할 개수
       const oqty = $("input.qnty").eq(index).val();
       //alert(oqty);
       
       const regExp = /^[0-9]+$/; //숫자만 체크하는 정규표현식
       const bool = regExp.test(oqty);
       
       if(!bool){ //숫자가 아닐때
          alert("수정하시려는 수량은 0개 이상이어야 합니다.");
            location.href = "javascript:history.back();";
            return;
       }
        
      // alert("장바구니 번호 " + cartno + "\n주문량 : " + oqty);
      

      if(oqty == "0"){
         alert("1개 이하의 상품은 선택하실 수 없습니다")
      }
      else{
         
         $.ajax({
            url : "<%= request.getContextPath() %>/jihee/bag/bagEdit.sue",
            type : "POST",
            data: {"cartno":cartno,
                    "oqty":oqty},
            dataType : "json",
            success : function(json){
               // {n:1}
               if(json.n == 1){
                  alert("주문수량이 변경되었습니다.");
                  $("#cartoptionModal").hide();
                  location.href = "bag.sue"; //장바구니 목록을 보여준다.
               }
            },
            error: function(request, status, error){
                 alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
              }
         });//end of ajax
         
      }//end of else
      
      
      
       
     }//end of goOqtyEdit() 
     
     
     function goOqtyEdit_minus (obj){
         
         const index = $("button.updateBtn_minus").index(obj);
         //alert(index);
         
         //수정해야 할 장바구니번호
         const cartno = $("input.cartno").eq(index).val();
         //alert("장바구니 번호 : " + cartno);
         
         //수정해야 할 개수
        const oqty = $("input.qnty").eq(index).val();
        //alert(oqty);
        
        const regExp = /^[0-9]+$/; //숫자만 체크하는 정규표현식
        const bool = regExp.test(oqty);
        
        if(!bool){ //숫자가 아닐때
           alert("수정하시려는 수량은 0개 이상이어야 합니다.");
             location.href = "javascript:history.back();";
             return;
        }
         
       // alert("장바구니 번호 " + cartno + "\n주문량 : " + oqty);
        

       if(oqty == "1"){
         alert("1개 이하의 상품은 선택하실 수 없습니다")
       }
       else{
          
          $.ajax({
             url : "<%= request.getContextPath() %>/jihee/bag/bagEdit_minus.sue",
             type : "POST",
             data: {"cartno":cartno,
                     "oqty":oqty},
             dataType : "json",
             success : function(json){
                // {n:1}
                if(json.n == 1){
                   alert("주문수량이 변경되었습니다.");
                   location.href = "bag.sue"; //장바구니 목록을 보여준다.
                }
             },
             error: function(request, status, error){
                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
               }
          });//end of ajax
          
       }//end of else
        
      }//end of goOqtyEdit() 
      
      
      
      
   // == 장바구니에서 특정 제품을 비우기 == //
      function goDel(obj){
         
         const index = $("button.deleteBtn").index(obj);
         //alert(index);
         
     //삭제할 제품이름
       const pname = $("input.pname").eq(index).val();
      // alert("제품이름 : " + pname);
         
        //삭제할 장바구니 번호
       const cartno = $("input.cartno").eq(index).val();
       //alert("장바구니 번호 : " + cartno);
       

       const bool = confirm(pname + "을 장바구니에서 제거하시겠습니까?");

       
         if(bool){
            
            $.ajax({
               url : "<%= request.getContextPath() %>/jihee/bag/bagDel.sue",
               type : "POST",
               data: {"cartno":cartno},
               dataType : "json",
               success : function(json){
                  // {n:1}
                  if(json.n == 1){
                     location.href = "bag.sue"; //장바구니 목록을 보여준다.
                  }
               },
               error: function(request, status, error){
                    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                 }
            });//end of ajax
            
         }
         else{
            alert("장바구니에서 " + pname + "제품 삭제를 취소하셨습니다.");
         }  
     

      }//end fo goDel
      
      // == 선택상품 주문 데이터보내기 == //
      function goOrder(){
          
          
          const checkCnt = $("input:checkbox[name='pnum']:checked").length;
            
            if(checkCnt < 1){
               alert("주문하실 제품을 선택하세요!!");
               return;
            }
            
            else{
              // == 체크박스에서 체크된 value값 (checked 속성 이용) == //
              // == 체크가 된 것만 값을 읽어와서 배열에 넣어준다 == //
              
              
              const allCnt = $("input:checkbox[name='pnum']").length;
              const pnumArr = new Array();
              const oqtyArr = new Array();
              const cartnoArr = new Array();
              const totalPrice = $("input.totalPrice").val();
              
              
              const prodCodeArr = new Array();
              const pordSizeArr = new Array();  
              const prodColorArr = new Array();
              const prodPriceArr =new Array(); //정상가
              const prodSalePriceArr = new Array(); //세일가
              let deliveryfee = $("input.deliveryfee").val();
              const prodPointArr = new Array();
              const totalorderprice = $("input.totalorderprice").val();
              const totalOnePriceJoinArr = new Array(); // 판매가X수량
              
              
              for(var i=0; i<allCnt; i++){
                 <%--
                    $("input:checkbox[name='pnum']").eq(i).is(":checked") 와
                    $("input:checkbox[name='pnum']").eq(i).prop("checked") 은 같은것이다
                 --%>
                 
    
                 if($("input:checkbox[name='pnum']").eq(i).is(":checked")){
                    pnumArr.push( $("input:checkbox[name='pnum']").eq(i).val() );
                    oqtyArr.push( $("input.qnty").eq(i).val() );
                    cartnoArr.push( $("input.cartno").eq(i).val() );
                    
                 
                    
                    
                    prodCodeArr.push( $("input.prodCode").eq(i).val() );
                    pordSizeArr.push( $("input.prodSize").eq(i).val() );
                    prodPriceArr.push( $("input.prodPrice").eq(i).val() );
                    prodSalePriceArr.push( $("input.prodSalePrice").eq(i).val() );
                 
                    prodPointArr.push( $("input.prodPoint").eq(i).val() );
                    
                    totalOnePriceJoinArr.push( $("input.totalOnePriceJoin").eq(i).val() );
                    prodColorArr.push( $("input.prodColor").eq(i).val() );
                    
                 }

                 
                 
              }//end of for
              
              /* for(var i=0; i<checkCnt; i++){
                 console.log("확인용 제품번호 : " + pnumArr[i]);
                 console.log("확인용 주문량 : " + oqtyArr[i]);
                 console.log("확인용 장바구니번호 : " + cartnoArr[i]);
                 console.log("확인용 총주문금액 : " + totalPriceArr[i]);
                 
                 console.log("확인용 prodCodeArr: " + prodCodeArr[i]);
                 console.log("확인용 pordSizeArr : " + pordSizeArr[i]);
                 console.log("확인용 prodPriceArr : " + prodPriceArr[i]);
                 console.log("확인용 prodSalePriceArr : " + prodSalePriceArr[i]);
                 console.log("확인용 deliveryfeeArr: " + deliveryfeeArr[i]);
                 console.log("확인용 prodPointArr : " + prodPointArr[i]);
                 console.log("확인용 totalorderpriceArr : " + totalorderpriceArr[i]);
                 console.log("확인용 totalOnePriceJoinAr : " + totalOnePriceJoinArr[i]);
                 console.log("확인용 prodColorArr : " + prodColorArr[i]);
              }//end of for */
               
              <%--
                 확인용 제품번호 : 5, 1, 60
                 확인용 주문량 ; 6, 1, 2
                 확인용 장바구니번호 : 5, 4, 1
                 확인용 주문금액 : 198000, 80000.., 90000..
                 확인용 5, 1, 60
              --%>
                 
                 const pnumjoin = pnumArr.join();
                 const countjoin = oqtyArr.join();
                 const cart_codeJoin = cartnoArr.join();
                 const prodCodeJoin = prodCodeArr.join();
                 
                 
                 
                 
                    
                   const colorJoin = prodColorArr.join();
                   const sizeJoin = pordSizeArr.join();
                  
                   const priceJoin = prodPriceArr.join(); // 정상가
                   const salepriceJoin = prodSalePriceArr.join(); //판매가
                   const totalOnePriceJoin = totalOnePriceJoinArr.join();  //판매가x수량
                   
                   const pointJoin = prodPointArr.join(); 
                   
                   
                   
                   let sumtotalPrice = 0;
                   for(var i=0; i<totalOnePriceJoinArr.length; i++){
                      sumtotalPrice += Number(totalOnePriceJoinArr[i]);
                   }
                   
                   
                   if (sumtotalPrice <= 70000 ) {
                      
                      deliveryfee = 2500;
                   }
                   
                   else if ( sumtotalPrice >= 70000 ) {
                      
                      deliveryfee = 0;
                   }
                
                /*  console.log("확인용 제품번호 : " + pnumjoin);
                 console.log("확인용 주문량 : " + countjoin);
                 console.log("확인용 prodCodeJoin: " + prodCodeJoin);
                 console.log("확인용 cart_codeJoin : " + cart_codeJoin);
                 console.log("확인용 totalPrice : " + totalPrice);
                 
                 
                 console.log("확인용 colorJoin : " + colorJoin);
                 console.log("확인용 sizeJoin : " + sizeJoin);
                 console.log("확인용 priceJoin : " + priceJoin);
                 console.log("확인용 salepriceJoin : " + salepriceJoin);
                 console.log("확인용 totalOnePriceJoin : " + totalOnePriceJoin);
                 console.log("확인용 deliveryfee : " + deliveryfee);
                 console.log("확인용 pointJoin : " + pointJoin);
                 console.log("확인용 totalorderprice : " + totalorderprice); */
                 
                 const str_sumtotalPrice = sumtotalPrice.toLocaleString("en"); // 자바스크립트에서 숫자 3자리마다 콤마를 찍어줌
                 
               
                 
              const bool = confirm("총주문액 : " + sumtotalPrice + "원 \n결제하시겠습니까?");
                 
              const frm = document.bag_form;
              
                 if(bool){

                   <%--  $.ajax({  
                       url : "<%= request.getContextPath()%>/hasol/purchase/purchase.sue",
                       type : "post",
                       data : {"totalPrice":totalPrice,
                             "deliveryfee":deliveryfee,
                             "cart_codeJoin":cart_codeJoin,
                             "prodCodeJoin":prodCodeJoin,
                             "countjoin":countjoin ,
                             "colorJoin":colorJoin,
                             "sizeJoin":sizeJoin,
                             "priceJoin":priceJoin,
                             "salepriceJoin":salepriceJoin,
                             "totalOnePriceJoin":totalOnePriceJoin,
                             "pointJoin":pointJoin,
                             "totalorderprice":totalorderprice},
                       dataType : "json",
                       success : function(json){
                          
                          console.log(json.nSuccess);
                           // json은 {"nSuccess", 1} 또는 {"nSuccess", 0}
                           if(json.nSuccess == 1 ){
                              location.href= "<%= request.getContextPath()%>/shop/orderList.up";
                           }
                           else{
                              location.href= "<%= request.getContextPath()%>/shop/orderError.up";
                           }
                          
                       },
                        error: function(request, status, error){
                            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                         }
                       
                    }); --%>
                  
                   
                    
                    $('input[name=totalOnePriceJoin]').attr('value',totalOnePriceJoin);
                    $('input[name="cart_codeJoin"]').attr('value',cart_codeJoin);
                    $('input[name="countjoin"]').attr('value',countjoin);
                    $('input[name="colorJoin"]').attr('value',colorJoin);
                    $('input[name="sizeJoin"]').attr('value',sizeJoin);
                    $('input[name="priceJoin"]').attr('value',priceJoin); 
                    $('input[name="salepriceJoin"]').attr('value',salepriceJoin);
                    $('input[name="pointJoin"]').attr('value',pointJoin);
                    $('input[name="prodCodeJoin"]').attr('value',prodCodeJoin);
                $('input[name="totalorderprice"]').attr('value',sumtotalPrice);
                    
                  
                
                   
                    
                    console.log("totalOnePriceJoin:"+totalOnePriceJoin);
                    
                    frm.action="<%= ctxPath%>/hasol/purchase/purchase.sue";
                    frm.method = "POST";
                    frm.submit();
                    
                   
                    
                 }
              
                 
                 else {
                    
                    alert("주문하기를 취소하셨습니다");
                    
                    
                    $(".chkboxpnum").prop("checked", false);
                 }
                 
                    
                    
                 
               
              
            }
            
        }
      
      // == 전체상품 주문 데이터 == //
      function allOrder() {
         

          $(".chkboxpnum").prop("checked", true);
          
          goOrder()
         
      }
      
      
     
      
      
      
      //==하나만 주문하기 ==// 
      
    function goOrderPart(obj) {
            
         
        const index = $("button.oneOrder").index(obj);
       // alert(index);
        
        const checkt = $(".chkboxpnum").eq(index).prop("checked", true);  
       // alert(checkt)
        goOrder()
        
       
       }

      //성택상품 삭제
    function goDelPart(){

       var checkCnt = $("input:checkbox[name=pnum]:checked").length;

       if(checkCnt < 1) {
           alert("삭제하실 제품을 선택하세요.");
           return; // 종료 
        }   
       
       else {
            //// == 체크박스에서 체크된 value값(checked 속성이용) == ////
            ///  == 체크가 된 것만 값을 읽어와서 배열에 넣어준다. /// 
            var allCnt = $("input:checkbox[name=pnum]").length;
            
            var cart_code_Arr = new Array();
             
             for(var i=0; i<allCnt; i++) {
                /* $("input:checkbox[name=pnum]").eq(i).prop("checked") */
                if( $("input:checkbox[name='pnum']").eq(i).is(":checked") ) {
                   cart_code_Arr.push( $("input:checkbox[name=pnum]").eq(i).val() );    
                  }//end of if
            }// end of for---------------------------
               
            for(var i=0; i<checkCnt; i++) {
               console.log("확인용 관심상품코드 : " + cart_code_Arr[i] );
            /*
                    확인용 제품번호: 3, 주문량: 3, 장바구니번호 : 14, 주문금액: 30000, 포인트: 15
                    확인용 제품번호: 56, 주문량: 2, 장바구니번호: 13, 주문금액: 2000000, 포인트 : 120 
                    확인용 제품번호: 59, 주문량: 3, 장바구니번호: 11, 주문금액: 30000, 포인트 : 300    
            */
            }// end of for---------------------------
            
          
            }//end of else   
    
       
         
    }
      

</script>

 <!-- Modal -->
   <div class="modal fade" id="cartoptionModal" tabindex="-1"
      aria-labelledby="cartoptionModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header" style="background-color: navy;">
               <h6 class="modal-title" id="cartoptionModalLabel"
                  style="color: white;">옵션변경</h6>
               <button type="button" class="btn-close-outline-light"
                  data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <input type="hidden" id="cartmodal_prod_code" value=""/>
               <input type="hidden" id="cartmodal_cart_code" value=""/>
               <ul>
                  <li id="cartmodal_prod_name" class="fw-bolder"></li>
                  <li>[옵션: <span id="cartmodal_prod_color"></span>/<span
                     id="cartmodal_prod_size"></span>]
                  </li>
               </ul>
               <hr style="background: black; height: 1px; background: black; border: 0px;">
               <ul>
                  <li class="fw-bolder">상품옵션</li>
                  <li style="margin-top: 1%;">
                     <div class="row">
                        <p class="col-md-2 fst-normal">COLOR</p>
                        <select id="cartmodal_colorselect"
                           class="form-select form-select-sm col-md-9"
                           aria-label=".form-select-sm example">
                        </select>
                     </div>
                  </li>
                  <li style="margin-top: 1%;">
                     <div class="row">
                        <p class="col-md-2 fst-normal">SIZE</p>
                        <select id="cartmodal_sizeselect"
                           class="form-select form-select-sm col-md-9"
                           aria-label=".form-select-sm example">
                        </select>
                     </div>
                  </li>
               </ul>
               <div></div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">닫기</button>
               <button id="cartmodal_optionupdate" type="button" class="btn btn-primary" >옵션 변경</button>
            </div>
         </div>
      </div>
   </div>
   <!-- Modal 끝 -->     


 
   <div id="container2" style="margin-left: 5%;">
      <p style="font-weight: bold; font-size: 30px; margin-top: 5%; margin-left:20px;" >장바구니</p>
      <div class="row container-fluid" >    
      <div class=""></div>  
         <div id="contents" class="col-lg-11" >
            <form name="bag_form">
               <div class="fst-normal" style="text-align: left; font-size: 20px;"></div>   
               <table id="notice_list" class="table table-condensed mt-4" style="font-size:15px; border-collapse: collapse; vertical-align: middle;"> <%-- 글은 10개까지만 보여주고 그 이상은 다음페이지로 넘기기 --%>
                 <colgroup>
               <col style="width:70px;">
               <col style="width:100px;">
               <col style="width:230px;">
               <col style="width:90px;">
               <col style="width:100px;">
               <col style="width:100px;">
               <col style="width:100px;">
               <col style="width:100px;">
            </colgroup>
                  <thead id="notice_thead">
                     <tr>
                        <th name="bag_th" class="w-10" style="border-top:solid 1px black; border-bottom:solid 1px black;" onclick="allSelect();">
       					<input type="checkbox" class="form-check-input" id="allCheckOrNone" onClick="allCheckBox();" style="position:relative; margin-left: 19%" />
                        </th>
                        
                        <th colspan="2" name="bag_th" class="w-30" style="text-align:center; border-top:solid 1px black; border-bottom:solid 1px black;" >상품정보</th>
                        <th name="bag_th" class="w-20" style="border-top:solid 1px black; border-bottom:solid 1px black;">수량</th>
                        <th name="bag_th" class="w-20" style="border-top:solid 1px black; border-bottom:solid 1px black;">적립금</th>
                        <th name="bag_th"class="w-20" style="border-top:solid 1px black; border-bottom:solid 1px black;">가격</th>
                        <th name="bag_th"class="w-20" style="border-top:solid 1px black; border-bottom:solid 1px black;">합계</th>
                        <th name="bag_th"class="w-20" style="border-top:solid 1px black; border-bottom:solid 1px black;">선택</th>

                     </tr>
                  </thead>
                  <tbody id="notice_tbody">
                  <c:if test="${empty requestScope.cartList}">
                  <tr>
                       <td colspan="8" align="center">
                         <span style="color: black; font-weight: bold;">
                            장바구니에 담긴 상품이 없습니다.
                         </span>
                       </td>   
                  </tr>
                  </c:if>   
                  
                  <!-- for each 시작 -->
                  <c:forEach var="cvo" items="${requestScope.cartList}" varStatus="status">
                     <tr style="vertical-align:middle; height : 150px; margin-top: 5%;">
                        <td style="border:none;"> <input class="form-check-input chkboxpnum selectall" type="checkbox" value="${cvo.prod.prod_code}" id="pnum" name="pnum" style="margin-left: 1%" ></td>
                        <td style="border:none;">
                       
                            
                              <img id="likeimg" src="<%= ctxPath%>/images/product/${cvo.prod.prod_image}" class="card-img-top" style="margin-left: 10%; size: 5%; ">
                           
                              </td>
                          
                              <td style="border:none;">
                              <ul style="float: left;">
                                 <li name ="prod_name" id="prod_name"  style="cursor: pointer">${cvo.prod.prod_name}</li>
                                <input type="hidden" class="pname" name="pname" value="${cvo.prod.prod_name}" /> 
                                 <li style="color:gray; margin-top: 2%;">[옵션: ${cvo.fk_prod_color}/${cvo.fk_prod_size}]</li>
                                 <input type="hidden" class="prodCode" name="prodCodeJoin" value="${cvo.fk_prod_code}" /> 
                                 <input type="hidden" class="prodColor" name="colorJoin" value="${cvo.fk_prod_color}" /> 
                                 <input type="hidden" class="prodSize" name="sizeJoin" value="${cvo.fk_prod_size}" /> 
                                 
                                 <li>
                              
                                 <!-- Button trigger modal -->
                           <button type="button" class="btn btn-outline-secondary btn-sm modalop" data-bs-toggle="modal" data-bs-target="#cartoptionModal"
                                    data-prodcode="${cvo.fk_prod_code}" data-prodname="${cvo.prod.prod_name}" data-prodcolor="${cvo.fk_prod_color}" data-prodsize="${cvo.fk_prod_size}"
                                    data-cartcode="${cvo.cart_code}"
                                    style="padding: 1%px; margin-top: 2%; border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt"
                                    >
                           옵션변경
                           </button>
                         
                        </li>
                     </ul>   
                     
                                              
                              
                        </td>
                        <td style="border:none;">
                        
                           <span><button type="button" class="updateBtn_minus" onclick="goOqtyEdit_minus(this);" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt; padding: ">
                              -
                              </button>
                              </span>
                              <span>
                              <input class="qnty" name="countjoin" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt; width: 30%;" name="qnty" id="qnty" value="${cvo.qnty}"/>
                               
                           </span>
                           <span>
                              <button type="button" class="updateBtn_plus" onclick="goOqtyEdit_plus(this);" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt; " >
                              +
                              </button>
                              </span>
                              <%-- 장바구니 테이블에서 특정제품의 현재주문수량을 변경하여 적용하려면 먼저 장바구니번호(시퀀스)를 알아야 한다 --%>
                             <input type="hidden" class="cartno" name="cart_codeJoin" value="${cvo.cart_code}" /> 
                           
                        </td>
                        <td style="border:none;">
                        <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif" alt="적립금" style="margin-bottom:2px;">${cvo.prod.prod_point}
                        <input type="hidden" class="prodPoint" name="pointJoin" value="${cvo.prod.prod_point}" /> 
                        </td>
                        <td style="border:none;"><fmt:formatNumber value="${cvo.prod.prod_saleprice}" pattern="###,###"></fmt:formatNumber></td>
                        <input type="hidden" class="prodSalePrice " name="salepriceJoin" value="${cvo.prod.prod_saleprice}" /> 
                        <input type="hidden" class="prodPrice " name="priceJoin" value="${cvo.prod.prod_price}" /> 
                        <td style="border:none;"><fmt:formatNumber value="${cvo.prod.totalPrice}" pattern="###,###"></fmt:formatNumber></td>
                        <input type="hidden" class="totalOnePriceJoin" name="totalOnePriceJoin" value="${cvo.prod.totalPrice}" /> 
                       
                        
                        <td style="border:none;">
                        <div>
                       <button type="button" id="doOrder" class="btn btn-gray oneOrder" style="background-color:gray; color:white; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;" onclick="goOrderPart(this);">주문하기</button>
                     </div>   
                     <div>   
                        <button type="button" class="btn btn-gray deleteBtn" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;" onclick="goDel(this);">삭제</button>
                   </div>
                        </td>
                     </tr>
                     </c:forEach>
                     <!-- 상품 한행 끝 -->
                     
                       



               
                     <tr style="vertical-align: baseline;" >
                         <td colspan="7" style="text-align: right;"> 상품 <span name="sumprice_span"><fmt:formatNumber value="${requestScope.sumMap.SUMTOTALPRICE}" pattern="###,###" /></span> + 
                         배송비 
                         <span>
                          <c:if test="${empty requestScope.cartList}">
                         <fmt:formatNumber value="0" pattern="###,###" />
                        </c:if> 
                        
                        <c:if test="${not empty requestScope.cartList}">
                         <c:if test="${requestScope.sumMap.SUMTOTALPRICE <= 70000}">
                         <fmt:formatNumber value="2500" pattern="###,###" />
                         </c:if>
                         <c:if test="${requestScope.sumMap.SUMTOTALPRICE >= 70000}">
                         <fmt:formatNumber value="0" pattern="###,###" />(무료)
                         </c:if>
                          </c:if>
                         </span> 
                         <input type="hidden" class="totalorderprice" name="totalorderprice" value="${requestScope.sumMap.SUMTOTALPRICE}" /> 
                         <input type="hidden" class="deliveryfee" name="deliveryfee" value="${requestScope.deliveryfee}" /> 
                         
                          = </td>
                         <td class="fw-bolder" style="font-size: 20px;"> <fmt:formatNumber value="${requestScope.totalSumPrice}" pattern="###,###" /></td>
                       <input type="hidden" class="totalPrice" name="totalPrice" value="${requestScope.totalSumPrice}" /> 
                       <input type="hidden" class="sumtotalPrice" name="sumtotalPrice" value="" /> 
                     
                     </tr> 
                  </tbody>
               </table>
               
            </form>
            
           <!--  <div class="col-2" style="border:solid 1px gray; font-size:15pt; display: flex; align-items: center; justify-content: center;">
         <button class="btn btn-lg" style="font-size:10pt; color:gray; text-align:center;" onclick=" goDelPart();">선택상품 삭제</button>
         </div> -->
         
         
         
            
         </div>
      </div>
      <div class="row container-fluid" > 
      <hr class="col-lg-11" style="margin-top: 5%; margin-bottom: 3%">
      
      <div class="row" style="text-align: center; font-size: 10pt">
       <p class="col-3"></p>
       <p class="col-1">총 상품금액</p>
       <p class="col-1"></p>
       <p class="col-1">총 배송금액</p>
       <p class="col-1"></p>
       <p class="col-2">결재예정금액</p> 
       <p class="col-3"></p>   
      </div>
      
      <div class="row" style="text-align: center; font-size: 15pt">
      <p class="col-3"></p>
       <p class="col-1 fw-bolder"><fmt:formatNumber value="${requestScope.sumMap.SUMTOTALPRICE}" pattern="###,###" /></p>
       <p class="col-1">+</p>
       <p class="col-1 fw-bolder">
       
                      <c:if test="${empty requestScope.cartList}">
                         <fmt:formatNumber value="0" pattern="###,###" />
                        </c:if> 
                        
                    <c:if test="${not empty requestScope.cartList}">
                      <c:if test="${requestScope.sumMap.SUMTOTALPRICE <= 70000}">
                         <fmt:formatNumber value="2500" pattern="###,###" />
                         </c:if>
                         <c:if test="${requestScope.sumMap.SUMTOTALPRICE >= 70000}">
                         <fmt:formatNumber value="0" pattern="###,###" />(무료)
                         </c:if>
                         </c:if></p>
                         
       <p class="col-1">=</p> 
       <p class="col-2 fw-bolder"> <fmt:formatNumber value="${requestScope.totalSumPrice}" pattern="###,###" /></p>    
       <p class="col-3"></p> 
      </div>
     
     <hr class="col-lg-11"style="margin-top: 3%; margin-bottom: 5%">
     
      <div class="row" style="flex: center;">
            
         <div class="col-lg-1"></div>
          <div class="col-lg-2"></div>
         <div class="col-lg-3" style="border:solid 1px black; display: flex; align-items: center; justify-content: center; margin-right: 10px;">
        <button class="btn btn-lg" id="orderSelect" style="font-size:15pt; color:black; text-align:center; " onclick="goOrder()">선택상품 주문</button>
        </div>
            
          <div class="col-lg-3" style="border:solid 1px #000033; display: flex; align-items: center; justify-content: center; background-color: #000033;">
        <button class="btn btn-lg" id="orderAll" style="font-size:15pt; color:white; text-align:center;" onclick="allOrder();">전체상품 주문</button>
        </div>
        <div class="col-lg-2"></div>
         <div class="col-lg-1"></div> 
      </div>
      
      <div>
      <p class="fw-bolder" style="font-size: 20pt; padding-left: 5%; padding-top: 5%">For you</p>
      </div>
      
   
          
          <!-- 이미지부분 카드 시작 -->
    <div class="row">
       <div class="col-lg-2"></div>
         <c:forEach var="pvo" items="${requestScope.bestProductList}" begin="0" end="2" step="1">
         <div class="col-lg-3" id="sideinfo" style="margin-bottom: 5% 10%; ">
              <div class="card" style="width: 16rem;">
                 <img src="<%= ctxPath%>/images/product/${pvo.prod_image}" class="card-img-top" alt="...">
                    <div class="card-body">
                      <div class="card-title" >
                      <c:forTokens var="color" items="${pvo.prod_color}" delims=",">
                      <span class="best_color" style="background-color: ${color};"> </span>      
                      </c:forTokens>
                      <span> &nbsp;&nbsp;&nbsp;&nbsp; 리뷰 ${pvo.prod_review_count} </span>
                      </div>
                      
                      <p class="card-text"><div class="fw-bolder">${pvo.prod_name} (${pvo.prod_high}cm) </div>
                      <%-- <c:if test="${pvo.prod_price} == ${pvo.prod_saleprice}">
                         </c:if> --%>
                      <c:if test="${pvo.prod_saleprice ne pvo.prod_price}">
                        <span><fmt:formatNumber value="${pvo.prod_saleprice}" pattern="###,###"></fmt:formatNumber></span>
                      <span style="color: #bfbfbf; text-decoration:line-through;"><fmt:formatNumber value="${pvo.prod_price}" pattern="#,###"/></span>
                     <span style="color: red; "> ${pvo.discountPercentBest}% </span>   </p>
                     </c:if>   
                     <c:if test="${pvo.prod_saleprice eq pvo.prod_price}">
                      <fmt:formatNumber value="${pvo.prod_price}" pattern="###,###"></fmt:formatNumber></p>
                     </c:if>   
                      <a href='/Semi_proj/heajun/product/productdetail.sue?prod_code=${pvo.prod_code}' class="stretched-link btn " style="color:white; background-color: #172A41;">상세페이지</a>
                    </div>
            </div>
           </div>
           </c:forEach>
         <div class="col-lg-1"></div>
      </div>   
      
      </div>
  

 
     
  
   
   

   
   

    
<div style="margin-top: 10%">
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>
</div>  


