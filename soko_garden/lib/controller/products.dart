import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soko_garden/api/apilist.dart';
import 'package:flutter/material.dart';

Future getoneproduct(int id, BuildContext context) async{
    try{
      http.Response feedback = await http.get(Uri.parse('$api/api/single_item/$id'));
    if(feedback.statusCode == 200){
      
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('Succesful')));
      
      
      return jsonDecode(feedback.body);
  }
    }
    catch(e){
     
         ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:  Text(e.toString())));
      
      
    }
  
  
  }

  Future getone(int id)async {
    try {
      var body = jsonEncode({
        "id":id
      });
    var url = Uri.parse('$api/single_item');
    var headers = {
      "Content-type":"application/json"
    };


      http.Response response = await http.post(url,body:body, headers:headers);
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else{
      
      return null;
    }

    }

    catch (e){
      print(e);
    }
  }

//   [
// 	1,
// 	"Samsung A03",
// 	"RAM 16GB, Storage 128GB",
// 	32000,
// 	"Smartphones",
// 	"phone1.jpg"
// ]



 Future getproducts() async{
    http.Response response = await http.get(Uri.parse('$api/api/products'));
    if(response.statusCode == 200){
        
        var products = jsonDecode(response.body);
        return products;

    }
  }

Future createProduct(Map product) async {

http.Response response = await http.post(
Uri.parse("$api/api/create"),
body: jsonEncode(product),
headers: {
  "Content-Type":"application/json"
},



);

if(response.statusCode == 200){
  return jsonDecode(response.body);
  
}

}




//         [
// 	[
// 		1,
// 		"Samsung A03",
// 		"RAM 16GB, Storage 128GB",
// 		32000,
// 		"Smartphones",
// 		"phone1.jpg"
// 	],
// 	[
// 		2,
// 		"Oppo Reno 7",
// 		"RAM 32GB,Storage 128GB",
// 		21000,
// 		"Smartphones",
// 		"phone6.jpg"
// 	],
// 	[
// 		3,
// 		"Oppo A37",
// 		"RAM 16GB, Storage 128GB",
// 		13000,
// 		"Smartphones",
// 		"phone4.jpg"
// 	],
// 	[
// 		4,
// 		"Tecno Spark 12",
// 		"RAM 64GB, Storage 256GB",
// 		32000,
// 		"Smartphones",
// 		"Tecno-Spark-10C-1.jpg"
// 	],
// 	[
// 		5,
// 		"Oppo Reno 10",
// 		"RAM 32GB,Storage 256GB",
// 		31000,
// 		"Smartphones",
// 		"reno10-5g-1256_628-blue.jpg"
// 	],
// 	[
// 		6,
// 		"Oppo Reno 11",
// 		"RAM 8GB,Storage 128GB",
// 		33400,
// 		"Smartphones",
// 		"oppo-reno-11-8gb-ram.jpg"
// 	],
// 	[
// 		7,
// 		"Tecno Phantom X",
// 		"RAM 16GB,Storage 128GB",
// 		45000,
// 		"Smartphones",
// 		"Phantom-X2-5G.jpg"
// 	],
// 	[
// 		8,
// 		"Tecno Pouvoir 4",
// 		"RAM 8GB,Storage 128GB",
// 		55000,
// 		"Smartphones",
// 		"Tecno-Pouvoir-4-a.jpg"
// 	],
// 	[
// 		9,
// 		"Samsung Galaxy Note 10",
// 		"RAM 64Gb,Storage 256GB",
// 		117000,
// 		"Smartphones",
// 		"Samsung Galaxy Note 10.jpg"
// 	],
// 	[
// 		10,
// 		"Samsung Galaxy A23",
// 		"RAM 64GB,Storage 512GB",
// 		120000,
// 		"Smartphones",
// 		"Samsung-Galaxy-A23-1.jpg"
// 	],
// 	[
// 		11,
// 		"Samsung Galaxy Note 20",
// 		"RAM 32GB,Storage 256GB",
// 		135000,
// 		"Smartphones",
// 		"Samsung Galaxy Note 20.jpeg"
// 	],
// 	[
// 		12,
// 		"Samsung Galaxy Note 22 Ultra",
// 		"RAM 64GB,Storage 256GB",
// 		167000,
// 		"Smartphones",
// 		"Samsung-Galaxy-S22-Ultrajpg"
// 	],
// 	[
// 		13,
// 		"Ramtons Microwave",
// 		"20L, 800W",
// 		22000,
// 		"Appliances",
// 		"microwave.jpg"
// 	],
// 	[
// 		14,
// 		"Synix Microwave",
// 		"28L, 900W",
// 		32000,
// 		"Appliances",
// 		"microwave 2.jpg"
// 	],
// 	[
// 		15,
// 		"Lyons Washing Machine",
// 		"Black color, 12KG",
// 		99000,
// 		"Appliances",
// 		"washing machine.png"
// 	],
// 	[
// 		16,
// 		"Ramtons Washing Machine",
// 		"White color,18KG",
// 		100000,
// 		"Appliances",
// 		"washing-machine 2.jpg"
// 	],
// 	[
// 		17,
// 		"Samsung Smart Fridge",
// 		"French door,588Litres",
// 		124000,
// 		"Appliances",
// 		"smart fridge.png"
// 	],
// 	[
// 		18,
// 		"LG Smart Fridge",
// 		"French door,485Litres",
// 		130000,
// 		"Appliances",
// 		"smart fridge 2.jpeg"
// 	],
// 	[
// 		19,
// 		"Appliances",
// 		"1Litre,12 cups",
// 		3500,
// 		"Appliances",
// 		"coffee maker.jpg"
// 	],
// 	[
// 		20,
// 		"Ramtons Cooker",
// 		"3 in 1,Grey color",
// 		110000,
// 		"Appliances",
// 		"cooker.jpg"
// 	],
// 	[
// 		21,
// 		"Lintons Toaster",
// 		"720-800W,Black",
// 		4500,
// 		"Appliances",
// 		"toaster.jpeg"
// 	],
// 	[
// 		22,
// 		"Lauben Toaster",
// 		"650-850W,Grey",
// 		5500,
// 		"Appliances",
// 		"lauben-toaster.jpg"
// 	],
// 	[
// 		23,
// 		"Samsung Neo QLED",
// 		"55\" Display size",
// 		134000,
// 		"Appliances",
// 		"Sansung Neo QLED.jpg"
// 	],
// 	[
// 		24,
// 		"Samsung Crystal HD",
// 		"72\" Display size",
// 		145000,
// 		"Appliances",
// 		"samsung tv.jpg"
// 	],
// 	[
// 		25,
// 		"Beats headphones",
// 		"silver color, wireless",
// 		3400,
// 		"Electronics",
// 		"headphones.jpg"
// 	],
// 	[
// 		26,
// 		"Beats headphones",
// 		"black color, wireless",
// 		3500,
// 		"Electronics",
// 		"headphones 2.jpg"
// 	],
// 	[
// 		27,
// 		"Smartwatch T500 series",
// 		"Pink color",
// 		4500,
// 		"Electronics",
// 		"smartwatch.jpg"
// 	],
// 	[
// 		28,
// 		"Oraimo Smartwatch 2 Pro",
// 		"Black in color",
// 		6000,
// 		"Electronics",
// 		"Oraimo smart watch.jpeg"
// 	],
// 	[
// 		29,
// 		"PS5 Controller",
// 		"Dualsense wireless controller, white color",
// 		13200,
// 		"Electronics",
// 		"controller.jpeg"
// 	],
// 	[
// 		30,
// 		"PS5 Controller",
// 		"Dual sense wireless controller, blue color",
// 		14500,
// 		"Electronics",
// 		"controller 2.jpg"
// 	],
// 	[
// 		31,
// 		"JBL Speakers",
// 		"Blue color, Excellent sound quality",
// 		13000,
// 		"Electronics",
// 		"jbl speakers.jpg"
// 	],
// 	[
// 		32,
// 		"Harman Kardon speakers",
// 		"Good sound quality, portable, black color",
// 		55000,
// 		"Electronics",
// 		"harman kardon.jpg"
// 	],
// 	[
// 		33,
// 		"Logitech mouse",
// 		"Wired mouse, portable",
// 		1500,
// 		"Electronics",
// 		"logitech mouse.jpg"
// 	],
// 	[
// 		34,
// 		"Astrix Guil MMO mouse",
// 		"Excellent for gaming,wireless",
// 		3500,
// 		"Electronics",
// 		"Atrix Guild MMO mouse.jpg"
// 	],
// 	[
// 		35,
// 		"4 in 1 PCS beddings",
// 		"Strawberry print duvet and beddings",
// 		3400,
// 		"Beddings",
// 		"bedding.jpg"
// 	],
// 	[
// 		36,
// 		"Aesthetic beddings",
// 		"Heart print duvet, pure cotton",
// 		4500,
// 		"Beddings",
// 		"bedding 3.jpg"
// 	],
// 	[
// 		37,
// 		"3 in 1 PCS beddings",
// 		"Polka dot print duvet and bed covers",
// 		3300,
// 		"Beddings",
// 		"bedding 2.jpg"
// 	],
// 	[
// 		38,
// 		"Sage green duvet",
// 		"Pure cotton, fluffy",
// 		2500,
// 		"Beddings",
// 		"bedding 4.jpg"
// 	],
// 	[
// 		39,
// 		"Green duvet",
// 		"Gridline print, pure cotton",
// 		2300,
// 		"Beddings",
// 		"bedding 5.jpg"
// 	],
// 	[
// 		40,
// 		"Multi-colored bedding 4 in 1 PCS",
// 		"Geometric shapes print",
// 		3100,
// 		"Beddings",
// 		"bedding 12.jpg"
// 	],
// 	[
// 		41,
// 		"Quilted beddings",
// 		"Pink, white and gray color, pure cotton",
// 		4000,
// 		"Beddings",
// 		"bedding 11.jpg"
// 	],
// 	[
// 		42,
// 		"Aesthetic bedding",
// 		"Monochrome color, tree print",
// 		4500,
// 		"Beddings",
// 		"bedding 8.jpg"
// 	],
// 	[
// 		43,
// 		"Aesthetic bedding 4 in 1 PCS",
// 		"Mandala print, white and blue color, pure cotton",
// 		3400,
// 		"Beddings",
// 		"bedding 7.jpg"
// 	],
// 	[
// 		44,
// 		"Aesthetic Royal beddings 3 in 1 PCS",
// 		"Red and gold colors, decorative and elegant, made of satin",
// 		5500,
// 		"Beddings",
// 		"bedding 10.jpg"
// 	],
// 	[
// 		45,
// 		"Comfy beddings 3 in 1 PCS",
// 		"Blue color, pure cotton material",
// 		4500,
// 		"Beddings",
// 		"bedding 9.jpg"
// 	],
// 	[
// 		46,
// 		"Aesthetic beddings",
// 		"Peach color, striped, 4 in 1 PCS",
// 		3300,
// 		"Beddings",
// 		"bedding 6.jpg"
// 	],
// 	[
// 		47,
// 		"Pleated skirt",
// 		"short, black in color",
// 		1200,
// 		"Clothes",
// 		"short pleated skirt.jpg"
// 	],
// 	[
// 		48,
// 		"Pleated skirt",
// 		"Long, peach color with floral print, belted",
// 		1300,
// 		"Clothes",
// 		"long pleated skirt.jpg"
// 	],
// 	[
// 		49,
// 		"Women's gown",
// 		"Floral pattern, laced",
// 		4300,
// 		"Clothes",
// 		"gown.jpg"
// 	],
// 	[
// 		50,
// 		"White gown",
// 		"Off-shoulder with sequins and a trail",
// 		4500,
// 		"Clothes",
// 		"white gown.jpg"
// 	],
// 	[
// 		51,
// 		"Polo shirt",
// 		"cream color with print",
// 		3500,
// 		"Clothes",
// 		"polo shirt men.jpg"
// 	],
// 	[
// 		52,
// 		"Camel coat",
// 		"Brown in color, long, cotton material",
// 		3600,
// 		"Clothes",
// 		"women's coat.jpg"
// 	],
// 	[
// 		53,
// 		"Flannel shirt for men",
// 		"Blue and yellow, checkered pattern",
// 		3500,
// 		"Clothes",
// 		"flannel shirt men.jpg"
// 	],
// 	[
// 		54,
// 		"Men's shirt",
// 		"Blue flannel shirt, checkered",
// 		3400,
// 		"Clothes",
// 		"blu flannel shirt.jpg"
// 	],
// 	[
// 		55,
// 		"Shorts for men",
// 		"Grey color",
// 		1300,
// 		"Clothes",
// 		"shorts.jpg"
// 	],
// 	[
// 		56,
// 		"Men's suit",
// 		"Tweed suit, 3 Piece wqith red polka dot tie",
// 		4500,
// 		"Clothes",
// 		"suit.jpg"
// 	],
// 	[
// 		57,
// 		"Suit",
// 		"Black color, with black turle neck shirt and black leaf brooch",
// 		6500,
// 		"Clothes",
// 		"black suit.jpg"
// 	],
// 	[
// 		58,
// 		"Men's suit",
// 		"Maroon-brown color, with black turtle neck",
// 		3400,
// 		"Clothes",
// 		"suit 2.jpeg"
// 	],
// 	[
// 		59,
// 		"Airpods",
// 		"white color, good sound quality",
// 		1500,
// 		"Electronics",
// 		"white airpods.jpg"
// 	],
// 	[
// 		60,
// 		"Apple airpods Pro Max",
// 		"Green color with green casing",
// 		1400,
// 		"Electronics",
// 		"airpods pro.jpg"
// 	],
// 	[
// 		61,
// 		"TestProduct",
// 		"test",
// 		68888,
// 		"Appliances",
// 		"WIN_20221024_14_52_41_Pro.jpg"
// 	]
// ]


