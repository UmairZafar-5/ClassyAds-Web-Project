create table tbl_Admin(
ad_id int identity primary key,
ad_name nvarchar(50) not null,
ad_email nvarchar(30) not null,
ad_password nvarchar(30));

create table tbl_User(
u_id int identity primary key,
u_name nvarchar(30) not null,
u_email nvarchar(30),
u_password nvarchar(30),
u_image nvarchar(MAX));

create table tbl_Category(
cat_id int identity primary key,
cat_name nvarchar(30) not null,
cat_view int,
cat_fk_ad int FOREIGN KEY REFERENCES tbl_Admin(ad_id),
cat_image nvarchar(MAX));


create table tbl_Product(
pro_id int identity primary key,
pro_name nvarchar(50) not null,
pro_des nvarchar(Max) not null,
pro_price nvarchar(50),
pro_contact nvarchar(20),
pro_view int,
pro_address nvarchar(200),
pro_image1 nvarchar(max),
pro_image2 nvarchar(max),
pro_image3 nvarchar(max),
pro_fk_user int FOREIGN KEY REFERENCES tbl_User(u_id),
pro_fk_cat int FOREIGN KEY REFERENCES tbl_Category(cat_id),
Featured bit,
Popular_Products bit
);

create table tbl_product_no(
n_id int identity primary key,
n_no int ,
n_fk_cat int FOREIGN KEY REFERENCES tbl_Category(cat_id)
);

-- Insert Data

INSERT INTO tbl_Admin
VALUES ('root','root@gmail.com','root123');
INSERT INTO tbl_Admin
VALUES ('admin','admin@gmail.com','admin123');

INSERT INTO tbl_User
VALUES ('Umair Zafar','omairzafar19985@gmail.com','Umair123','~/Content/upload/86565594849571292_1201073970047737_7519670248400748544_n (1).jpg');
INSERT INTO tbl_User
VALUES ('ahmed','ahmed@gmail.com','Ahmed@125','~/Content/upload/user.png');

INSERT INTO tbl_Category
VALUES ('Real Estate',0,1,null);
INSERT INTO tbl_Category
VALUES ('Books & Magazines',0,1,null);
INSERT INTO tbl_Category
VALUES ('Furniture',0,1,null);
INSERT INTO tbl_Category
VALUES ('Electronics',0,1,null);
INSERT INTO tbl_Category
VALUES ('Cars & Vehicles',0,1,null);
INSERT INTO tbl_Category
VALUES ('Other',0,1,null);

create table tbl_Product(
pro_id int identity primary key,
pro_name nvarchar(50) not null,
pro_des nvarchar(Max) not null,
pro_price nvarchar(50),
pro_contact nvarchar(20),
pro_view int,
pro_address nvarchar(200),
pro_image1 nvarchar(max),
pro_image2 nvarchar(max),
pro_image3 nvarchar(max),
pro_fk_user int FOREIGN KEY REFERENCES tbl_User(u_id),
pro_fk_cat int FOREIGN KEY REFERENCES tbl_Category(cat_id),
Featured bit,
Popular_Products bit
);

INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Honda BR-V ivtec','Brand new tyres installed recently Converted to i-vtec S leather seats android panel , sil plates , front and back camera all windows+front screen tinted total genuine miner 2-3 dents those are repaired without paint',
26,'Chungi No. 22 Road, Rawalpindi, Punjab',
'~/Content/upload/22552308348715a79-74bb-4bb5-b952-8e61984c2d8c.jpg',
'~/Content/upload/17665789395f56f176-f1aa-4734-b0dc-cf633ff73b1d.jpg',
'~/Content/upload/183436308545816caf-d818-4c17-bce7-cefd52b5951a.jpg',
1,5,'03442936367','Rs 2,695,000',1,null
);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Toyota Corolla GLI Model 2018','Automatic transmission    Islamabad no    Silver colour    Complete documents    Condition 9/10    Feel free to contact us but only call and also mention OLX car is available in G11 markaz Islamabad 0314_ 5383868'
,3,'G-11, Islamabad, Islamabad Capital Territory',
'~/Content/upload/44002914338f4b806-1744-4e46-9df5-de86e202165f.jpg',
'~/Content/upload/886572520594a2fd-2d41-4215-a64f-68d50814a01f.jpg',
'~/Content/upload/859185180e27493a9-ebbf-4296-858b-a89cb3e65f55.jpg',
1,5,'03442936367','Rs 2,750,000',NULL,NULL);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Toyota Vitz Model 2008',
'Toyota Vitz Model 2008    Import 2012    Red colour    Push button start    Complete documents    Condition 8/ 10    Lahore no    Feel free to contact us but only call and also mention OLX car is available in G11 markaz Islamabad    0314_ 5383868',
2,'G-11, Islamabad, Islamabad Capital Territory',
'~/Content/upload/6018316524c682a90-3179-4615-9e02-9c5e284baf88.jpg',
'~/Content/upload/21428875088bf074ef-e784-4296-8b74-5946a499a2a1.jpg',
'~/Content/upload/1185087826a54e4bd3-5384-445e-abb1-f2daefaad40f.jpg',
1,5,'03442936367','Rs 1,370,000',NULL,NULL);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Honda City 1.3 Prosmetic',
'Make Honda  Model City IVTEC  Year 2018  KMs driven 13,000 km  Fuel Petrol  Condition Used  Registered in Lahore    Total Genuine Scratchless    As like new',
7,'Gulshan-e-Aiwan Housing Society, Lahore, Punjab',
'~/Content/upload/17412000042e3801ba-a46b-4a63-8c02-2ff24032f812.jpg',
'~/Content/upload/7834003228492555e-0310-4557-9ef2-35f284951356.jpg',
'~/Content/upload/1202556359a125c79c-cb1c-415f-b83a-1d5bbd340e8b.jpg',
1,5,'03442936367','Rs 2,425,000',NULL,NULL);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Honda vesel Z sencing pearl White color',
'HONDA VEZEL    Z SENSING    PEARL WHITE    2017 MODEL    2020 MARCH IMPORT    26,000 KM    Electric Memory Seats    DEMAND @ RS 47,00,000    Auto Pilot Driven    Push Start    Power Window    Power Steering    Electric Memory Seats    Heated Seats    8 Air Bags    Extra ordnery Roof Light    Original Honda Alloy Rims    Climate Control AC    Leather Seats    Cruise Control    Multimedia Steering    Hatch Back Seats    Radar Distance Control    Earth Dream Technology    HID Head Light    DSLR Lights    SMD Fog Lights    4 AUTO Power Window    Retractable Mirror    Rear Tinted Glass    Paddle Shiffter    Arm Rest',
17,'Daska, Punjab, Pakistan',
'~/Content/upload/6955243374d6b68cd-c669-46a3-9b19-52a37bcae033.jpg',
'~/Content/upload/6955243379ceaa45d-4efb-4cb8-842b-ef3e7cf0f6dd.jpg',
'~/Content/upload/1466052265baed94c6-fea8-480e-89c4-de8b2acfec45.jpg',
1,5,'03442936367','Rs 4,700,000',1,NULL);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES (
'Iphone 8 64gb gold color',
'Condition 10/10    Exchange not possible    Non PTA    thumb id perfect working    sealed original display    battery health 85%    faltu sawal nhi    only olx chat',
0,'University Road, Karachi, Sindh',
'~/Content/upload/467173651e5e43e3-e0c4-40af-bd08-350f2f7c6c16.jpg',
'~/Content/upload/46587340218630be3-88c9-4046-9d17-b6b383d4973c.jpg',
'~/Content/upload/1304185476ca840f00-1855-4c69-b6fa-d6dae8500edd.jpg',
1,4,'03442936367','37 Thousands',NULL,NULL
);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('White','S10 plus 10 by 10 pti approved with box chager',0
,'Samanabad, Lahore, Punjab',
'~/Content/upload/180103352761f86c8c-ee01-4d9e-9090-4e342efbc3a7.jpg',
'~/Content/upload/144966163683b249da-ebcd-4f73-b059-e2ba4958d905.jpg',
'~/Content/upload/4918619549a4b034c-6b62-4043-8d6a-671a7e87756f.jpg',
1,4,'03442936367','Rs 100,000',1,NULL);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('iphone x jv pta approve xchange possible',
'Iphone x jv pta approve ha condition zara rough ha line ha lcd me exchange possible ha only mobile',
0,'Muslim Town, Lahore, Punjab',
'~/Content/upload/1054090994c356cd7b-6188-49de-bf1b-60a8f6277f43.jpg',
'~/Content/upload/7027191031338f99d-e447-41e5-a904-2af9ee45e5cb.jpg',
'~/Content/upload/11218751407bd3c148-862f-45e2-b254-ffba55b9fe77.jpg',
1,4,'03442936367','Rs 68,000',NULL,NULL);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Iphone 7 plus 256 GB',
'Iphone 7 plus 256 GB    Storage# 256GB    Colour# silver, rose gold & matt black    Condition 9/10    100% original american piece    Pta Approved & Non.approved both available',
0,'Saddar, Karachi, Sindh','~/Content/upload/146129799939e84a9e-e18b-41f8-86f1-b3f47e1231f9.jpg',
'~/Content/upload/15212642602a7d75d-7f4f-496b-a92a-ce00a8b1bbf6.jpg',
'~/Content/upload/1760966428b461e30c-ce0a-43d0-b8ce-82e990c2ce7f.jpg',
1,4,'03442936367','Rs 57,000',1,NULL);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('32 INCH Simple LED',
'Shop no 4 Taj mahal plaza 6th road choke Murree Road Rawalpind',
0,'Chandni Chowk, Rawalpindi, Punjab',
'~/Content/upload/430974610758c8703-e1f9-409a-b40b-62c796b865c1.jpg',
'~/Content/upload/185254285866e56ffe-e048-4f75-8b37-bf7ff449bc72.jpg',
'~/Content/upload/3560995310e89c560-ddbc-465b-8d96-759f3cefeae4.jpg',
1,4,'03442936367','Rs 12,500',NULL,NULL);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Sofa set new',
'Sofa sets    7 seater    Ready to deliver    High quality    10 years foam and frame warranty    For more designs plz whatsapp',
7,'Gulshan-E-Iqbal Block 13, Karachi, Sindh',
'~/Content/upload/6489614689522b722-f9ec-4a05-8bce-9257da6a1006.jpg',
'~/Content/upload/10681175058a88c1f3-abc5-4734-96c5-482efa9fdbcf.jpg',
'~/Content/upload/14872735421eb10f73-29e6-4df0-ad7d-4e7cd1b44d47.jpg',
1,3,'03442936367','Rs 110,000',1,NULL);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Fancy Unique Double Carving Bed Set For Sale',
'Fancy Double Carving Bed with Side tables and dressing 33000    I m selling 2 months used all furniture    Wapda town    Please call for more pics or whtsap    0333/6572708',
0,'Wapda Town, Lahore, Punjab',
'~/Content/upload/101465953009191725-8b59-477b-a0a3-79f4921a7dae.jpg',
'~/Content/upload/4082317396ea0a1b3-0692-466d-a708-c1fa24e3297d.jpg',
'~/Content/upload/827387776ca9a1751-e611-4011-83d3-84d7ebcb7bbe.jpg',
1,3,'03442936367','Rs 33,000',1,NULL);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Paramount Villas',
'5, 6, 7, 8 & 10 Marla Residential Plots.  Prime location on Khanewal Road.  Fully Developed & Ready For Possession.  Paramount Villas is an exclusive residential community which provides all the modern facilities of life with a relaxing and serene environment guaranteed. Approved by the relevant Department MDA Multan, Paramount Villas offers 5,6, 7, and 10 marla residential plots.These plots have been expertly designed and planned with an exquisite layout to provide ease and comfort for its residents. This project is in a prime location and is the perfect place for a comfortable family lifestyle, as it offers complete security with manned entrances and exits, along with a dedicated 24/7 security staff. It also incorporates lush greenery in its landscape to provide residents with scenery they can admire.We are also providing the architectural plan of the Houses, & assistance in Mepco & all other government department issues for all valuable residents.',
1,'Main Khanewal Road, Opposite Multan CNG Pump, Multan',
'~/Content/upload/63263486894f69ae0-8f90-4060-b2bb-d5ea7dac3501.jpg',
'~/Content/upload/10517909059b82e0ed-5b8c-4604-bd0c-091336a1076b.jpg',
'~/Content/upload/939912230ba6cd57-7488-4f5b-8d64-0b97927c786d.jpg',
1,1,'03442936367','Rs 48.6 Lakh',NULL,1);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Al Jalil Garden',
'Multiple upcoming governmental developments, such as Lahore-to-Karachi Motorway, are being developed nearby.  Three blocks already sold out  Each architectural design decision has been given the utmost thought.  Al Jalil Garden is envisaged as a well-planned, highly affordable and aesthetically designed housing scheme offering luxurious facilities, features and amenities to its residents and clients in a secure gated community. Al Jalil Garden offers an ideal lifestyle with 24/7 security, lush green parks in each block, wide roads and walkways in a pollution-free environment.',
0,'Main Sheikhupura - Sharaqpur Rd, Lahore',
'~/Content/upload/1929689296a6cd0824-8d1e-435d-a974-31d2eff13727.jpg',
'~/Content/upload/552733577c1d9f702-a81e-458f-87fd-36969c524e08.jpg',
'~/Content/upload/43324596971f6d540-fb40-4185-a03f-ce7fc4747b63.jpg',
1,1,'03442936367','RS 75 Lakh',NULL,1);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Chapal Skymark',
'Located Off University Road, Scheme 33, The Project Is Minutes Away From Schools, Shopping And Business Districts.  Chapal Skymark, one of the tallest residential tower of Pakistan. A 50 storey luxury residential tower to be raised on Karachi‘s soil is truly reaching out of the stars, both in terms of the architectural brilliance and the lifestyle it has to offer. Spacious suites planned with all getting a corner view along with all the facilities for its residents.',
0,'Dr Ziauddin Ahmed Rd, Civil Lines Kashmir Mujahid Colony, Karachi, Sindh',
'~/Content/upload/430336263c226d484-67b3-411e-b44e-10f8b3c9d5b1.jpg',
'~/Content/upload/1200864191babf9a1e-7630-4148-b5ef-f446858b170a.jpg',
'~/Content/upload/1268648337154a29e2-6f76-4ff8-aa73-4f6bf9a661d3.jpg',
1,1,'03442936367','RS 5 Crore',NULL,1);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Gucci ','Influential, innovative and progressive, Gucci is reinventing a wholly modern approach to fashion. Under the new vision of creative director Alessandro Michele, the House has redefined luxury for the 21st century, further reinforcing its position as one of the world’s most desirable fashion houses. Eclectic, contemporary, romantic—Gucci products represent the pinnacle of Italian craftsmanship and are unsurpassed for their quality and attention to detail.    Gucci is part of the Kering Group. A global Luxury group, Kering manages the development of a series of renowned Houses in Fashion, Leather Goods, Jewelry and Watches.',
0,'G-9, Islamabad, Islamabad Capital Territory',
'~/Content/upload/1702725194dd4b175a-7b2f-494a-be2a-5cab8c9af491.jpg',
'~/Content/upload/1351353303307039f8-a11a-4275-bf43-ed2ec3be9322.jpg',
'~/Content/upload/2002393623009906b1-6f74-4faa-b000-d7afdabf5573.jpg',
1,10,'03442936367','Rs 20K To 300K ',NULL,1);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Construction services',
'All type of houses, shops, plazas    Heavy appartments buildings and projects Construction, selling and matketing services available at your demand',
0,'Defence Road, Lahore, Punjab','~/Content/upload/2066848462094273-image-1573009072.jpg',
'~/Content/upload/1747740702construction-2.jpg','-1',
1,1,'03442936367','Rs 1 Lakh to 10 Lakh',NULL,1);
INSERT INTO tbl_Product (pro_name,pro_des,pro_view,pro_address,pro_image1,pro_image2,pro_image3,pro_fk_user,pro_fk_cat,pro_contact,pro_price,Featured,Popular_Products)
VALUES ('Digital Quran pen',
' لوک ڈاون کا فائدہ اٹھائیں گھر بیٹھے اپنے بچوں کو قرآن پاک سکھائیں۔ اپنے بچوں کو اسلامی تعلیم دیں اپنا وقت اپنے بچوں اور والدین کو دیں۔    قرآن پین خریدنے کے لیے رابطہ کریں',
2,'Gurumangat, Lahore, Punjab',
'~/Content/upload/1130105294965dc1c0-5f72-435f-8a9c-69d358f0e9c5.jpg',
'~/Content/upload/523677503dba5492f-5625-4ebe-a816-9d76032e0c37.jpg',
'~/Content/upload/9428335404d060612-5089-4e61-bdc9-00e1f5084d90.jpg',
1,2,'03442936367','Rs 3,800',NULL,NULL);

