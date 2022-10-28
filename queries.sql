create database testdb;

use testdb;

-- Place the dump file in the current working directory 
source ./db01-2022_04_24_17_44_44-dump.sql

select gp.product_name, gp.product_img_url, gp.product_url, gp.product_price_min, gp.product_short_description from grommet_products gp left join grommet_product_categories gpc on gp.id = gpc.product_id left join grommet_gifts_categories ggc on gpc.product_category_id = ggc.id where gp.is_sold_out=0 and ggc.sub_category = 'Jewelry';


select gp.product_name, gp.product_img_url, gp.product_url, gp.product_price_min, gp.product_short_description from grommet_products gp left join grommet_product_to_keyword gptk on gp.id = gptk.product_id left join grommet_product_keywords gpk on gptk.keyword_id = gpk.id where gpk.keyword="Hair accessor" and gp.is_sold_out=0 ;


select gp.product_name, gp.product_img_url, gp.product_url, gp.product_price_min, gp.product_short_description from grommet_products gp left join grommet_product_to_keyword gptk on gp.id = gptk.product_id left join grommet_product_keywords gpk on gptk.keyword_id = gpk.id where gp.is_sold_out=0 and ( gp.grommet_category like 'Beauty & Personal Care' or gp.grommet_category like 'Skincare' or gpk.keyword = 'Aromatherapy' );  
