<?php
namespace app\controllers;
use core\App;
use core\Session;
use app\models\Products_info;
use app\models\Products;
use app\models\Sizes;
use app\models\Category;
use core\Pagination;

class PublicController
{
      public function index(){
            if(!isset($_GET['page'])) {
                $current_page = 1;
                $limit = 12;
                $count = Products_info::count();
                $allpage = $count[0]->total_record;

                $paging = new Pagination();
                $paging->init("indexpaging", $current_page, $limit,$allpage);
                $products_info = Products_info::allPagination($current_page,$limit);
                $cats = Category::find('gender',1);
                $hot_product = Products_info::getHotProduct();
                $gender_men_cats=Category::find('gender',1);
                $gender_women_cats=Category::find('gender',0);
                return view('public/index',['products_info' => $products_info,
                'allpage' => $allpage,
                'cats' => $cats, 
                'hot_product' => $hot_product,
                'gender_men_cats'=>$gender_men_cats,
                'gender_women_cats'=>$gender_women_cats,
                'paginghtml'=>$paging->html()]); 
            } else {
                $current_page = $_GET['page'];
                $allpage = $_GET['allpage'];
                $limit = 12;
                $products_info = Products_info::allPagination($current_page,$limit);
                $paging = new Pagination();
                $paging->init("indexpaging", $current_page, $limit,$allpage);
                echo 
                '<div class="box-title">Featutes</div>';    
                    foreach($products_info as $item)  {
                echo '<div class="product">
                    <div class="cover-img">
                        <a href="detail/'.$item->id.'">
                            <img src="/public/upload/product_info/'.$item->image.'" alt="">
                        </a>
                    </div>
                    <span class="name">'.$item->name.'</span>
                    <span class="price">$'.$item->price.'</span>
                </div>';
                     } 
                echo '<div class="row">
                    <div class="col-lg-12">
                        <div class="cover-pagination">
                           '.$paging->html().'
                        </div>
                    </div>
                </div>
            </div>';
            }
       }
	
       public function detail($product_info_id)
       {   
            $color = Products::getColor($product_info_id);
            $size = Products::getSize($product_info_id);
            $productInfo = Products_info::find('id',$product_info_id);
            $gender_men_cats=Category::find('gender',1);
            $gender_women_cats=Category::find('gender',0);
            return view('public/detail',['size' =>$size,'color'=>$color,'productInfo'=>$productInfo,
            'gender_men_cats'=>$gender_men_cats,
            'gender_women_cats'=>$gender_women_cats]);
        }

        public function PlusNumber()
        {
            $currentNumber = isset($_POST['aNumber']) ? $_POST['aNumber'] : ' ' ;
            $newNumber = 1+$currentNumber;
            echo  '<input class="num" type="text" value="'.$newNumber.'" id="num" disabled >' ;
        }

        public function SubNumber()
        {
            $currentNumber = isset($_POST['aNumber']) ? $_POST['aNumber'] : ' ' ;
            $newNumber = $currentNumber-1;
            echo  '<input class="num" type="text" value="'.$newNumber.'" id="num" disabled >' ;
                
        }

        public function updateCart()
        {
           
            if ( Session::getSession('cart') !=null) {

                $arrCart = Session::getSession('cart');        
                $cout =0;
                 $arr1 = isset($_GET['aJson']) ? json_decode($_GET['aJson']) : ' ' ;

                  foreach ($arr1 as $key => $value) {               
                    $products = Products::find('id',$key);
                    $quantity = $products[0]->quantity;

                    if( $value<=$quantity AND $value >0) {
                         $arrCart[$key] =$value;
                    }

                  }
                  Session::createSession('cart',$arrCart);
                  foreach ($arrCart as $key => $value) {
                     $cout +=$value;
                  }
                  $arrCart['quantity'] = $cout;
                  Session::createSession('num',$cout);
                  die(json_encode($arrCart));    
            }                
        }

        public function cart()
        {         
            $arrStore= array();
            $gender_men_cats=Category::find('gender',1);
            $gender_women_cats=Category::find('gender',0);

            if ( Session::getSession('cart') !=null) {
                foreach (Session::getSession('cart') as $key => $value) {
                   $arrStore[$key]= Products::getAllCart($key)[0];              
                }
                return view('public/cart',['arrStore'=>$arrStore,'gender_men_cats'=>$gender_men_cats,'gender_women_cats'=>$gender_women_cats]);

            }else{
                return view('public/cart',['gender_men_cats'=>$gender_men_cats,'gender_women_cats'=>$gender_women_cats]);
            }
        }

        public function cat($id)
        {
            $cat_products_info=Products_info::getProductInfoByCat($id);
            $gender_men_cats=Category::find('gender',1);
            $gender_women_cats=Category::find('gender',0);
            $hot_product = Products_info::getHotProduct();
            $cat=Category::find('id',$id);

            return view('public/cat',['cat_products_info'=>$cat_products_info,'gender_men_cats'=>$gender_men_cats,'gender_women_cats'=>$gender_women_cats,'cat'=>$cat,'hot_product'=>$hot_product]);
        }

        public function delete($id)
        {   
            $num=0;
           
            $arr = Session::getSession('cart');
            if ( Session::getSession('cart')[$id] !=null) {
                foreach ($arr as $key => $value) {
                    if($id == $key) {
                        unset( $arr[$id]);
                    }
                }
                Session::createSession('cart',$arr);
                foreach ( Session::getSession('cart') as $key => $value) {
                    $num +=$value;
                }
                Session::createSession('num',$num);
                redirect('cart');
            }
        }

        public function addCart()
        {           
            $check = 0;
            $size = isset($_POST['aSize']) ? $_POST['aSize'] : 0 ;
            $color = isset($_POST['aColor']) ? $_POST['aColor'] : 0 ;
            $products_info_id = isset($_POST['aProduct_info_id']) ? $_POST['aProduct_info_id'] : 0 ;
            $num = isset($_POST['aNum']) ? $_POST['aNum'] : 0 ;        
            $products = Products::getProduct($products_info_id,$size,$color);  

            if (empty($products)) {
                die(json_encode($check));
            } else { 

                         if ($num<1) {
                             $arr["check"] =0;
                             die(json_encode($arr));
                        } else {
                            $arr = array();                             
                       
                            if ( Session::getSession('cart') ==null) {  
                                if ($products[0]->quantity<$num) {
                                     $arr["check"] =2;
                                     $arr["quantity"] =$products[0]->quantity;
                                     die(json_encode($arr));
                                } else {
                                        
                                        $_SESSION['cart'] =array($products[0]->id =>$num);
                                        $arr["quantity"] =$num;
                                        $arr["check"] =1;
                                        Session::createSession('num',$num);                           
                                        die(json_encode($arr));                                                          
                                }
                            } else {                          
                                $cart=Session::getSession('cart');
                                $checkID = false;  //kiem tra id da co chua
                                $coutCart =0;
                                $id =$products[0]->id;

                                if (isset($cart[$id])) {
                                    $currentNum =Session::getSession('cart')[$id];
                                    $newNum = $currentNum + $num;
                                 
                                    if ($products[0]->quantity < $newNum ) {
                                       $arr["check"] =2;
                                       $order=$products[0]->quantity-$currentNum;
                                       $arr["quantity"] =$order;
                                        die(json_encode($arr));                                      
                                    } else {
                                             $cart[$id] = $newNum;
                                             Session::createSession('cart',$cart);
                                    }                                 
                                } else {
                                       if ($products[0]->quantity < $num) {                          
                                            $arr["check"] =2;
                                            $arr["quantity"] =$products[0]->quantity;
                                            die(json_encode($arr));
                                       } else {
                                            $cart[$id]=$num;
                                            Session::createSession('cart',$cart);
                                       } 
                                }                                   

                                foreach ( $cart as $key => $value) {
                                    $coutCart += $value;
                                }
                               Session::createSession('num',$coutCart);
                               $arr["check"] =1;
                               $arr["quantity"] =$coutCart;
                               die(json_encode($arr));
                         }
                    }
                }    
            
            }

        public function buy()
        {
          
            $arrStore= array();
            $gender_men_cats=Category::find('gender',1);
            $gender_women_cats=Category::find('gender',0);

            if ( Session::getSession('cart') !=null) {
                foreach (Session::getSession('cart') as $key => $value) {
                   $arrStore[$key]= Products::getAllCart($key)[0];              
                }
                return view('public/buy',['arrStore'=>$arrStore,'gender_men_cats'=>$gender_men_cats,'gender_women_cats'=>$gender_women_cats]);

            }else{
                return redirect('home');
            }
        }
        public function check()
        {
            if (isset($_POST['smBuy'])) {

                if (isset($_POST['payments'])) {

                    $fullname = trim($_POST['name']);
                    $phone = trim($_POST['phone']);
                    $email = trim($_POST['email']);
                    $address = trim($_POST['address']);
                    $payment = $_POST['payments'];
                    
                    //empty
                    if ($fullname =='' || $phone =='' ||  $email =='' ||  $address=='') {
                          Session::createSession('msg','Please complete all information !') ;
                          redirect('buy');
                          die();
                    } else {
                            //valid
                          $checkEmail = ' /^[a-zA-Z0-9@_]{6,}$/';
                          $checkPhone =  ' /^[0-9]{10,11}$/';

                          if (!preg_match($checkPhone, $phone,$match) || !preg_match($checkEmail, $phone,$match)) {

                             Session::createSession('msg','please enter a valid email or phone !') ;
                             redirect('buy');
                             die();
                          } else {

                            //add san pham

                          }
                    }

                } else {
                      Session::createSession('msg','Please choose payment !') ;
                      redirect('buy');
                      die();
                }
            }
        }

       public function getProductInfoByGender()
       {
            $string_gender=trim(parse_url($_SERVER['REQUEST_URI'],PHP_URL_PATH),'/');
            if($string_gender=='men'){
                $id=1;
            }else{
                $id=0;
            }
            $gender_products_info=Category::getProductInfoByGender($id);
            $hot_product=Products_info::getHotProduct();
            $gender_men_cats=Category::find('gender',1);
            $gender_women_cats=Category::find('gender',0);
            return view('public/gender_product_info',['gender_products_info'=>$gender_products_info,'hot_product'=>$hot_product,'gender_men_cats'=>$gender_men_cats,'gender_women_cats'=>$gender_women_cats]);
           }

        public function getCat() {
            $gender = isset($_POST['gender']) ? $_POST['gender'] : 0;
            $cats = Category::find('gender',$gender);
            $html = 'abc';
            foreach($cats as $item) {
                $html .= '<option value="'.$item->id.'">'.$item->name.'</option>';
            }
            echo $html;
        }

        public function searchProduct() {
            if(isset($_GET['style']) && isset($_GET['style'])) {
                $style = $_GET['style'];
                $price = $_GET['price'];
                $current_page = !empty($_GET['page'])? $_GET['page'] : 1;

                $ArrProducts = Products_info::search($style, $price);
                $count = count($ArrProducts);
                $limit = 12;

                $products_info = Products_info::getProductsSearch($current_page,
                $limit, $style, $price);
                $paging = new Pagination();
                $paging->init("searchFilter",$current_page, $limit, $count);
                echo 
                '<div class="box-title">Featutes</div>';    
                    foreach($products_info as $item)  {
                echo '<div class="product">
                    <div class="cover-img">
                        <a href="detail/'.$item->id.'">
                            <img src="/public/upload/product_info/'.$item->image.'" alt="">
                        </a>
                    </div>
                    <span class="name">'.$item->name.'</span>
                    <span class="price">$'.$item->price.'</span>
                </div>';
                     } 
                echo '<div class="row">
                    <div class="col-lg-12">
                        <div class="cover-pagination">
                           '.$paging->html().'
                        </div>
                    </div>
                </div>
            </div>';
            }
        }
    }

?>