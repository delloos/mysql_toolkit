-- Disable binlog for current session must be user with privileged
-- SET sql_log_bin = 0;
-- Drop procedure if it exist
-- DROP PROCEDURE mysql.mysqlsnap;
-- change delimiter to create procedure

-- delimiter //
-- CREATE PROCEDURE mysql.mysqlsnap ()
-- BEGIN


	-- Select some useful variables
	select '' as '<div style="display:none">';
	-- Select Full Version
	SELECT 
		 @version_full := substring(variable_value,(-(length(variable_value))), (locate('-', variable_value)-1))
	FROM 
		performance_schema.global_variables 
	WHERE 
		variable_name = 'VERSION';
	-- select min version
	-- select @version_short := left(@version_full, 3);	
	-- select @version_short := cast(replace(@version_full, ',','');
	
	-- ###################### GET possible configuration ########################
	
	-- TMP TABLE CREATION
	SELECT @data_dir := VARIABLE_VALUE FROM performance_schema.global_variables WHERE VARIABLE_NAME = 'data_dir';
	SELECT @base_dir := VARIABLE_VALUE FROM performance_schema.global_variables WHERE VARIABLE_NAME = 'base_dir';
	SELECT @slow_query_log := VARIABLE_VALUE FROM performance_schema.global_variables WHERE VARIABLE_NAME = 'slow_query_log_file';
	SET @cnf_etc = '/etc/my.cnf';
	SET @cnf_data = concat(@data_dir, '/my.cnf');
	SET @cnf_base = concat(@base_dir, '/my.cnf');
	SET @cnf_home = '~/my.cnf';
	-- Load my.cnf or my.ini when possible then
	-- delete from mysql.tmptest;
	-- LOAD DATA LOCAL INFILE '/Applications/MAMP/conf/my.cnf' into table mysql.tmptest;
	-- update mysql.tmptest set data2 = replace(data2, CHAR(13, 10), '<hr />');
	-- Load my.cnf or my.ini when possible then
	
	-- DROP TABLE mysql.tmptest;
	
	-- check if local in file enable
	
	-- SET @load_data_enabled != select variable_value from performance_schema.global_variables WHERE VARIABLE_NAME = 'local_infile';
	
	
	/*CREATE TABLE mysql.tmptest (data2 varchar(255));
	CREATE TABLE mysql.tmptest2 (data2 varchar(255));*/
	
	/*IF (@load_data_enabled = 1) THEN 
		LOAD DATA LOCAL INFILE @cnf_data into table mysql.tmptest;
		select counter := count(*) from mysql.tmptest;
		IF (@counter > 0) then
			INSERT INTO mysql.test2 SELECT * FROM mysql.test;	
		END IF;
		truncate mysql.test;
		LOAD DATA LOCAL INFILE @cnf_etc into table mysql.tmptest;
		select counter := count(*) from mysql.tmptest;
		IF (@counter > 0) then
			INSERT INTO mysql.test2 SELECT * FROM mysql.test;	
		END IF;
		truncate mysql.test;
		LOAD DATA LOCAL INFILE @cnf_base into table mysql.tmptest;
		select counter := count(*) from mysql.tmptest;
		IF (@counter > 0) then
			INSERT INTO mysql.test2 SELECT * FROM mysql.test;	
		END IF;
		truncate mysql.test;
		LOAD DATA LOCAL INFILE @cnf_home into table mysql.tmptest;
		select counter := count(*) from mysql.tmptest;
		IF (@counter > 0) then
			INSERT INTO mysql.test2 SELECT * FROM mysql.test;	
		END IF;
	
	END IF;
	truncate mysql.test;*/
	
	
	-- ##################### SLOW QUERY LOG ###################
	
	-- LOAD DATA LOCAL INFILE @slow_query_log_file into table mysql.tmptest;
	
	-- update mysql.tmptest set data2 = replace(data2, CHAR(13, 10), '<hr />');
	
	/*
	update mysql.tmptest2 set data2 = replace(data2, '\r', '<br />');
	update mysql.tmptest2 set data2 = replace(data2, '\n', '<br />');
	*/
	
	
	-- select count(*) from mysql.tmptest where data2 like '%\\r%';
	/*update mysql.tmptest set data2 = concat(concat('<span style="color:green;font-weight:bold">',data2),'</span>') where data2 not like '#%';
	*/-- select * from mysql.tmptest;
	/*delete table mysql.tmptest;*/
	/*
	update mysql.tmptest set data2 = replace(data2, '\r', '<br />');
	update mysql.tmptest set data2 = replace(data2, '\n', '<br />');
	*/
	
	
	-- select count(*) from mysql.tmptest where data2 like '%\\r%';
	/*update mysql.tmptest set data2 = concat(concat('<span style="color:green;font-weight:bold">',data2),'</span>') where data2 not like '#%';
	select data2 as '' from mysql.tmptest;
	drop table mysql.tmptest;
	*/
	

	
	select '' as '</div>';
	select @version_short;
	select '' as '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">';
	select '' as '<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<style type="text/css">
				th, td {
					border:1px solid \#CECECE 
					}
		</style>';
	
	-- select '' as '<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>';
	-- select '' as '<script src="highcharts.js"></script>';
	select '' as '<style type="text/css">html {height:100%;font-family:verdana;} body {height:100%} th, td {border:1px solid \#CECECE;}
	table {border-collapse:collapse;width:800px}';
	select '' as ' th {padding:2px 10px} 
		#container {margin-left:220px}
		#sidebar a {color:rgb(234,124,0);margin-left:20px;display:block;-webkit-appearance:none;text-decoration:none, margin-left:20px}';
	select '' as '#sidebar {width:200px;position:fixed;top:0;float:left;background:rgb(4,90,132);height:100%}
		tr:nth-child(even) {background: #CCC}
		tr:nth-child(odd) {background: #FFF}
	</style>';
	select '' as '
		</head>
		<body style="margin:0;padding:0">';
		
	-- Sidebar div
	select '' as '<div id="sidebar">';
	select '' as '<a href="#size">Size</a>';
	select '' as '<a href="#file">Logs and file path</a>';
	select '' as '<a href="#advanced">Advanced features</a>';
	select '' as '<a href="#tmptables">TMP Tables</a>';
	select '' as '<a href="#opentables">Open Tables</a>';
	select '' as '<a href="#memory">Memory Footprint</a>';
	select '' as '<a href="#innodb">InnoDB</a>';
	select '' as '<a href="#size">Size</a>';
	select '' as '<a href="#thread">Thread</a>';
	select '' as '</div>';
	
	-- container
	select '' as '<div id="container">';
	
	-- header
	select '' as '<div id="header">';
	select '' as '<h1>MySQL Snapshot Tool</h1>';
	select '' as '</div>';
	
	select '' as '<h2>Instance</h2>';
	select '' as '<table>';
	select concat('<tr><td>',VARIABLE_NAME, '</td><td>') as '<tr><th>Item</th><th>', concat(case when VARIABLE_NAME IN ('UPTIME', 'UPTIME_SINCE_FLUSH_STATUS') then VARIABLE_VALUE/60/60 else VARIABLE_VALUE end,'</td></tr>') as 'Value</th></tr>' from performance_schema.global_variables WHERE variable_name like '%VERSION%'
	UNION ALL
	select concat('<tr><td>',VARIABLE_NAME, '</td><td>') as '', concat(round(VARIABLE_VALUE/60/60,1),' H</td></tr>') as '' from performance_schema.global_status WHERE variable_name like 'UPTIME%';
	select '' as '</table>';
	
	

	############################### TABLE FRAGMENTATION ##################################
	
	
	-- ####################################### SIZE #################################
	select '' as '<h2><a name="size">Size</a></h2>';
	select '' as '<table>';
	select concat('<tr><td>',table_schema, '</td><td>') as '<tr><th>Schema</th><th>', concat(cast(truncate(sum(data_length+index_length+data_free)/1024/1024,2) as char), ' Mb</td><td>') as 'Size</th><th>',
	concat(cast(truncate(sum(data_length)/1024/1024,1) as char), ' Mb</td><td>') as 'Data_length</th><th>',
	concat(cast(truncate(sum(index_length)/1024/1024,1) as char), ' Mb</td><td>') as 'Index_length</th><th>',
	concat(cast(truncate(sum(data_free)/1024/1024,1) as char), ' Mb</td></tr>') as 'Data_free</th></tr>'
	from information_schema.tables group by table_schema
	union all
	select '<tr><td>TOTAL</td><td>', concat(truncate(sum(data_length+index_length+data_free)/1024/1024,2), ' Mb</td><td>'),
	concat(cast(truncate(sum(data_length)/1024/1024,1) as char), ' Mb</td><td>') as Data_length,
	concat(cast(truncate(sum(index_length)/1024/1024,1) as char), ' Mb</td><td>') as Index_length,
	concat(cast(truncate(sum(data_free)/1024/1024,1) as char), ' Mb</td></tr>') as Data_free from information_schema.tables
	union all
	(select '<tr><td>=====</td>', '<td>=====</td>', '<td>=</td>', '<td>=</td>', '<td>=</td></tr>' from mysql.user limit 0,1)
	union all
	select concat('<tr><td>',engine,'</td><td>'), concat(cast(truncate(sum(data_length+index_length+data_free)/1024/1024,2) as char), ' Mb</td><td>'),
	concat(cast(truncate(sum(data_length)/1024/1024,1) as char), ' Mb</td><td>') as Data_length,
	concat(cast(truncate(sum(index_length)/1024/1024,1) as char), ' Mb</td><td>') as Index_length,
	concat(cast(truncate(sum(data_free)/1024/1024,1) as char), ' Mb</td></tr>') as Data_free 
	from information_schema.tables group by engine;
	select '' as '</table>';
	
	select '' as '<h2><a name="file">Logs and files path</a></h2>';
	-- select '' as '<table>';
	-- select concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	-- from performance_schema.global_variables where variable_name like '%log%' order by variable_name;
	-- select '' as '</table>';
	-- select '' as '<h2>File Path</h2>';
	
	
	select '' as '<table>';
	select concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_variables where (variable_value like '%/%' or variable_value like '%\%') or variable_name like '%dir%' order by variable_name;
	select '' as '</table>';
	
	
	###################################  INDEX Multi colonnes ##################################
	
	    select * from information_schema.statistics where SEQ_IN_INDEX > 1 and table_schema not in  ('mysql', 'information_schema', 'performance_schema','sys');
	
		############################### TABLE FRAGMENTATION ##################################
		select '<table>' as '';
        select '<tr><td>Schema</td><td>Table</td><td>Total</td><td>Espace Libre</td><td>Frag %</td></tr>' as '';
		select concat('<tr><td>',table_schema, '</td><td>') as '', concat(table_name, '</td><td>'),
		concat(case
	when (data_length+index_length+data_free) >= 1073741824 then concat(round((data_length+index_length+data_free)/1024/1024/1024,2), ' Go')
	when (data_length+index_length+data_free) >= 1048576 then concat(round((data_length+index_length+data_free)/1024/1024,2), ' Mo')
	when (data_length+index_length+data_free) >= 1024 then concat(round((data_length+index_length+data_free)/1024,2), ' Ko')
	else concat((data_length+index_length+data_free), ' octets') end, '</td><td>') as size,
		-- (data_length+index_length+data_free)/1024/1024 as 'total', 
		concat(case
	when data_free >= 1073741824 then concat(round(data_free/1024/1024/1024,2), ' Go')
	when data_free >= 1048576 then concat(round(data_free/1024/1024,2), ' Mo')
	when data_free >= 1024 then concat(round(data_free/1024,2), ' Ko')
	else concat(data_free, ' octets') end, '</td><td>') as 'free space',
		concat(concat(round((data_free/(data_length+index_length+data_free))*100,2),' %'), '</td><td>') as fragmentation,
		concat(round((data_free/(data_length+index_length+data_free)) * (data_free*data_free)/1000,0), '</td></tr>') as 'total gain arbitrary'
		from information_schema.tables 
		where table_schema not in('mysql', 'information_schema', 'performance_schema', 'sys') order by 6 desc;
        select '</table>' as '';
        /*select concat('<tr><td>',table_schema, '</td><td>') as 'Schema', concat(table_name, '</td><td>',
		case
	when (data_length+index_length+data_free) >= 1073741824 then concat(round((data_length+index_length+data_free)/1024/1024/1024,2), ' Go')
	when (data_length+index_length+data_free) >= 1048576 then concat(round((data_length+index_length+data_free)/1024/1024,2), ' Mo')
	when (data_length+index_length+data_free) >= 1024 then concat(round((data_length+index_length+data_free)/1024,2), ' Ko')
	else concat((data_length+index_length+data_free), ' octets') end as size,
		-- (data_length+index_length+data_free)/1024/1024 as 'total', 
		case
	when data_free >= 1073741824 then concat(round(data_free/1024/1024/1024,2), ' Go')
	when data_free >= 1048576 then concat(round(data_free/1024/1024,2), ' Mo')
	when data_free >= 1024 then concat(round(data_free/1024,2), ' Ko')
	else concat(data_free, ' octets') end as 'free space',
		concat(round((data_free/(data_length+index_length+data_free))*100,2),' %') as fragmentation,
		round((data_free/(data_length+index_length+data_free)) * (data_free*data_free)/1000,0) as 'total gain arbitrary'
		from information_schema.tables 
		where table_schema not in('mysql', 'information_schema', 'performance_schema') order by 6 desc;*/
	
	
	/*Gain
	 frag * size
	 20% * 4Go
	40% * 2 Go
	
	*/
	-- ######################################### ADVANCED FEATURES ############################################
	
	select '' as '<h2><a name="advanced">Advanced features used</a></h2>';
	select '' as '<table>';
	select '<tr><td>Partitionning</td>' as '', concat('<td>',COALESCE((select 'YES' from INFORMATION_SCHEMA.PARTITIONS WHERE PARTITION_METHOD IS NOT NULL LIMIT 0,1), 'NO'), '</td></tr>') as '';
	select '<tr><td>InnoDB Compression</td>' as '', concat('<td>',COALESCE((select 'YES' from INFORMATION_SCHEMA.TABLES WHERE ROW_FORMAT = 'COMPRESSED' && ENGINE = 'INNODB' LIMIT 0,1), 'NO'), '</td></tr>') as '';
	select '<tr><td>MyISAM Compression</td>' as '', concat('<td>',COALESCE((select 'YES' from INFORMATION_SCHEMA.TABLES WHERE ROW_FORMAT = 'COMPRESSED' && ENGINE = 'MYISAM' LIMIT 0,1), 'NO'), '</td></tr>') as '';
	select '<tr><td>Events</td>' as '', concat('<td>',COALESCE((select 'YES' from MYSQL.EVENT LIMIT 0,1), 'NO'), '</td></tr>') as '';
	
	-- select concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	-- from performance_schema.global_variables.where variable_value like '%/%' order by variable_name or variable_name like '%dir%';
	select '' as '</table>';
	
	select '' as '<table>';
	
	
	-- ########################### OPEN TABLES ##########################
	
	select '' as '<h2><a name="opentables">Open table</a></h2>';
	select '' as '<table>';
	select '<tr><td>Average Ratio/h</td>' as '', 
	concat('<td>',variable_value / (select round(min(variable_value)/3600,2) from performance_schema.global_status where 
		variable_name = 'uptime' or variable_name = 'uptime_since_flush_status'), ' </td></tr>') as '' from performance_schema.global_status where variable_name = 'opened_tables'
		union all 
	select '<tr><td>open tables</td>',
	concat('<td>',variable_value,'</td></tr>')
	from performance_schema.global_status where variable_name = 'open_tables'
	union all
	select '<tr><td>opened tables</td>',
	concat('<td>',variable_value,'</td></tr>')
	from performance_schema.global_status where variable_name = 'opened_tables'
	union all
	select '<tr><td>Table open cache (unit)</td>',
	concat('<td>',variable_value,'</td></tr>')
	from performance_schema.global_variables where variable_name = 'table_open_cache'
	union all
	select '<tr><td>Table open cache (unit)</td>',
	concat('<td>',variable_value,'</td></tr>')
	from performance_schema.global_variables where variable_name = 'table_open_cache_instance'
	union all
	select '<tr><td>Table open cache misses </td>',
	concat('<td>',variable_value,'</td></tr>')
	from performance_schema.global_status where variable_name = 'table_open_cache_misses'
	union all
	select '<tr><td>table_open_cache_hits</td>',
	concat('<td>',variable_value,'</td></tr>')
	from performance_schema.global_status where variable_name = 'table_open_cache_hits';
	select '' as '</table>';    
	
	-- ############################ TMP TABLES ###########################
	
	select '' as '<h2><a name="tmptables">Tmp tables</a></h2>';
	select '' as '<table>';
	select '<tr><td>Average Ratio/h</td>' as '', 
	concat('<td>',round(variable_value / (select min(variable_value)/3600 from performance_schema.global_status where 
		variable_name = 'uptime' or variable_name = 'uptime_since_flush_status'),2), ' </td></tr>') as '' from performance_schema.global_status where variable_name = 'created_tmp_tables'
		union all 
	select '<tr><td>Average Ratio on disk/h</td>' as '', 
	concat('<td>',round(variable_value / (select min(variable_value)/3600 from performance_schema.global_status where 
		variable_name = 'uptime' or variable_name = 'uptime_since_flush_status'),2), ' </td></tr>') as '' from performance_schema.global_status where variable_name = 'created_tmp_disk_tables'
		union all 
	select '<tr><td>Created tmp tables</td>',
	concat('<td>',variable_value,'</td></tr>')
	from performance_schema.global_status where variable_name = 'created_tmp_tables'
	union all
	select '<tr><td>Created tmp tables on disk</td>',
	concat('<td>',variable_value,'</td></tr>')
	from performance_schema.global_status where variable_name = 'created_tmp_disk_tables'
	union all
	select '<tr><td>Average Ratio disk/memory</td>',
	concat('<td>',round(((select variable_value from performance_schema.global_status 
	where variable_name = 'created_tmp_disk_tables')/(select variable_value 
		from performance_schema.global_status where variable_name = 'created_tmp_tables'))*100,2),'%</td></tr>')
	union all
	select '<tr><td>max heap table size</td>',
	concat('<td>',variable_value/1024/1024,'Mo</td></tr>') from performance_schema.global_variables where variable_name = 'max_heap_table_size'
	union all
	
	select '<tr><td>tmp table size</td>',
	concat('<td>',variable_value/1024/1024,'Mo</td></tr>') from performance_schema.global_variables where variable_name = 'tmp_table_size'
	union all
	select '<tr><td>max tmp table</td>',
	concat('<td>',variable_value,'</td></tr>') from performance_schema.global_variables where variable_name = 'max_tmp_tables';
	
	select '' as '</table>';    
	
	
	-- ############################ Statistics ##############################
	-- ################################### Memory Foot print ###########################
	
	select '' as '<h2><a name="memory">Memory Foot print</a></h2>';
	
	select '' as '<p>join_buffer_size allocated for each full join (join without index)</p>';
	select '' as '<table>';
	select concat('<tr><td>',variable_name,'</td>') as '', concat('<td>', case  
	when variable_value >= 1073741824 then concat(variable_value/1024/1024/1024, ' Go')
	when variable_value >= 1048576 then concat(variable_value/1024/1024, ' Mo')
	when variable_value >= 1024 then concat(variable_value/1024, ' Ko')
	else concat(variable_value, ' octets') end,'</td></tr>') as '' 
	from performance_schema.global_variables 
	where variable_name in ('key_buffer_size', 'query_cache_size', 'tmp_table_size', 'innodb_buffer_pool_size', 'innodb_additional_mem_pool_size', 'innodb_log_buffer_size')
	union all 
	select '<tr><td>Total for buffer</td>', 
		(
			select concat('<td>',round(sum(variable_value)/1024/1024/1024,2),' Go</td></tr>') 
			from performance_schema.global_variables 
			where variable_name in ('key_buffer_size', 'query_cache_size', 'tmp_table_size', 'innodb_buffer_pool_size', 'innodb_additional_mem_pool_size', 'innodb_log_buffer_size')
		);
	select '' as '</table>';
	
	select '' as '<h2>Dynamic memory</h2>';
	select '' as '<table>';
	select concat('<tr><td>',variable_name,'</td>') as '', concat('<td>', case  
	when variable_value >= 1073741824 then concat(variable_value/1024/1024/1024, ' Go')
	when variable_value >= 1048576 then concat(variable_value/1024/1024, ' Mo')
	when variable_value >= 1024 then concat(variable_value/1024, ' Ko')
	else concat(variable_value, ' octets') end,'</td></tr>') as '' 
	from performance_schema.global_variables 
	where variable_name in ('sort_buffer_size', 'read_buffer_size', 'read_rnd_buffer_size', 'join_buffer_size', 'thread_stack', 'binlog_cache_size')
	union all 
	select '<tr><td>Total for buffer for 1 connection (if all buffer allocated)</td>', 
		(
			select concat('<td>',round(sum(variable_value)/1024/1024,2),' Mo</td></tr>') 
			from performance_schema.global_variables 
			where variable_name in ('sort_buffer_size', 'read_buffer_size', 'read_rnd_buffer_size', 'join_buffer_size', 'thread_stack', 'binlog_cache_size')
		)
		union all 
	select concat('<tr><td>Total for buffer with max connection (set to ', (select @@max_connections),')</td>'), 
		(
			select concat('<td>',round((sum(variable_value)/1024/1024)* (select @@max_connections),2),' Mo</td></tr>') 
			from performance_schema.global_variables 
			where variable_name in ('sort_buffer_size', 'read_buffer_size', 'read_rnd_buffer_size', 'join_buffer_size', 'thread_stack', 'binlog_cache_size')
		);
	select '' as '</table>';
	
	
	-- ############################################ Thread ########################################
	
	/*select '' as '<h2>Connection</h2>';
	select '' as '<table>';
	select concat('<tr><td>',variable_name,'</td>') as '', concat('<td>', case  
	when variable_value >= 1073741824 then concat(variable_value/1024/1024/1024, ' Go')
	when variable_value >= 1048576 then concat(variable_value/1024/1024, ' Mo')
	when variable_value >= 1024 then concat(variable_value/1024, ' Ko')
	else concat(variable_value, ' octets') end,'</td></tr>') as '' 
	from performance_schema.global_variables 
	where variable_name in ('sort_buffer_size', 'read_buffer_size', 'read_rnd_buffer_size', 'join_buffer_size', 'thread_stack', 'binlog_cache_size');
	*/
	
	-- #####################################################################
	
	/*select @buffer_pool_total := variable_value as '' from performance_schema.global_status where variable_name = 'innodb_buffer_pool_pages_total';
	select @buffer_pool_free := variable_value as '' from performance_schema.global_status where variable_name = 'innodb_buffer_pool_pages_free';
	select @buffer_pool_dirty := variable_value as '' from performance_schema.global_status where variable_name = 'innodb_buffer_pool_pages_dirty'; 
	select @buffer_pool_data := variable_value as '' from performance_schema.global_status where variable_name = 'innodb_buffer_pool_pages_data';
	*/
	select '' as '<h1><a name="binlog">Binlog</a></h1>';
	
	select '' as '<pre>';
	show binary logs;
	select '' as '</pre>';
	select '' as '<table>';
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_variables where ( variable_name like '%binlog%' or variable_name like '%log_bin%') and variable_name not like '%com%'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '' 
	from performance_schema.global_status where variable_name like '%binlog%' and variable_name not like '%com%';
	select '' as '</table>';
	
	
	-- ################################## INNODB ############################
	
	select '<div style="display:none">';
	SELECT @innodb_buffer_pool_pages_free := VARIABLE_VALUE FROM performance_schema.global_status WHERE VARIABLE_NAME = 'innodb_buffer_pool_pages_free';
	SELECT @innodb_buffer_pool_pages_total := VARIABLE_VALUE FROM performance_schema.global_status WHERE VARIABLE_NAME = 'innodb_buffer_pool_pages_total';
	SELECT @innodb_buffer_pool_pages_misc := VARIABLE_VALUE FROM performance_schema.global_status WHERE VARIABLE_NAME = 'innodb_buffer_pool_pages_misc';
	SELECT @innodb_buffer_pool_pages_data := VARIABLE_VALUE FROM performance_schema.global_status WHERE VARIABLE_NAME = 'innodb_buffer_pool_pages_data';
	SELECT @innodb_buffer_pool_pages_dirty := VARIABLE_VALUE FROM performance_schema.global_status WHERE VARIABLE_NAME = 'innodb_buffer_pool_pages_dirty';
	SELECT @innodb_page_size := VARIABLE_VALUE FROM performance_schema.global_status WHERE VARIABLE_NAME = 'innodb_page_size';
	-- select @buffer_page_size;
	select '</div>';
	select '' as '<h1><a name="innodb">InnoDB</a></h1>';
	select '' as '<table>';
	select 
		concat('<tr><td>',VARIABLE_NAME,'</td><td>') as '<tr><th>Buffer</th><th>', 
		concat(@innodb_buffer_pool_pages_total, '</td><td>') as 'Page</th><th>', 
		concat(round((@innodb_buffer_pool_pages_total * @innodb_page_size)/1024/1024,2), ' Mb</td><td>') as 'Size (Mb)</th><th>', 
		'100%</th></tr>' as 'Percent' 
	FROM 
		performance_schema.global_status 
	WHERE 
		VARIABLE_NAME = 'innodb_buffer_pool_pages_total' 
	UNION ALL
	SELECT 
		concat('<tr><td>',VARIABLE_NAME,'</td><td>'), 
		concat(@innodb_buffer_pool_pages_free, '</td><td>'), 
		concat(round((@innodb_buffer_pool_pages_free * @innodb_page_size) / 1024 / 1024, 2), ' Mb</td><td>'),
		concat(round((@innodb_buffer_pool_pages_free / @innodb_buffer_pool_pages_total) * 100, 1), '%</td></tr>') 
	FROM 
		performance_schema.global_status 
	WHERE 
		VARIABLE_NAME = 'innodb_buffer_pool_pages_free' 
	UNION ALL
	SELECT 
		concat('<tr><td>',VARIABLE_NAME,'</td><td>'), 
		concat(@innodb_buffer_pool_pages_misc, '</td><td>'),
		concat(round((@innodb_buffer_pool_pages_misc * @innodb_page_size) / 1024 / 1024, 2), ' Mb</td><td>'),
		concat(@innodb_buffer_pool_pages_misc, '</td></tr>') -- concat(round((@innodb_buffer_pool_pages_misc / @innodb_buffer_pool_pages_total) * 100, 1), '%</td></tr>') 
	FROM 
		performance_schema.global_status 
	WHERE 
		VARIABLE_NAME = 'innodb_buffer_pool_pages_misc'
	UNION ALL
	SELECT 
		concat('<tr><td>',VARIABLE_NAME,'</td><td>'), 
		concat(@innodb_buffer_pool_pages_data, '</td><td>'),
		concat(round((@innodb_buffer_pool_pages_data * @innodb_page_size) / 1024 / 1024, 2), ' Mb</td><td>'),
		concat(round((@innodb_buffer_pool_pages_data / @innodb_buffer_pool_pages_total) * 100, 1), '%</td></tr>') 
	FROM 
		performance_schema.global_status 
	WHERE 
		VARIABLE_NAME = 'innodb_buffer_pool_pages_data'
	UNION ALL
	SELECT 
		concat('<tr><td>',VARIABLE_NAME,'</td><td>'), 
		concat(@innodb_buffer_pool_pages_dirty, '</td><td>'),
		concat(round((@innodb_buffer_pool_pages_dirty * @innodb_page_size) / 1024 / 1024, 2), ' Mb</td><td>'),
		concat(round((@innodb_buffer_pool_pages_dirty / @innodb_buffer_pool_pages_total) * 100, 1), '%</td></tr>') 
	FROM 
		performance_schema.global_status 
	WHERE 
		VARIABLE_NAME = 'innodb_buffer_pool_pages_dirty';
			
	select '' as  '</table>';
	
	-- ################# THREAD ###############
	
	select '' as '<h1><a name="thread">Threads</a></h1>';
	
	select '' as '<table>';
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_status where variable_name like '%thread%'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_variables where variable_name like '%thread%';
	select '' as '</table>';
	
	############## Query Cache ###############
	
	select '' as '<h1><a name="thread">Threads</a></h1>';
	
	select '' as '<table>';
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_variables where variable_name = 'have_query_cache'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_variables where variable_name = 'query_cache_type'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_variables where variable_name = 'query_cache_min_res_unit'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_variables where variable_name = 'query_cache_size'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_variables where variable_name = 'query_cache_limit'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_status where variable_name = 'qcache_inserts'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_status where variable_name = 'qcache_hits'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_status where variable_name = 'qcache_free_blocks'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_status where variable_name = 'qcache_free_memory'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_status where variable_name = 'qcache_lowmem_prunes'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_status where variable_name = 'qcache_not_cached'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_status where variable_name = 'qcache_queries_in_cache'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
	from performance_schema.global_status where variable_name = 'qcache_total_blocks';
	select '' as '</table>';
	
	############### Process List #################
	select '' as '<h1><a name="processlist">Full Process List</a></h1>';
	select '' as '<table>';
	SELECT 
		concat('<tr><td>',id,'</td><td>') as '<tr><th>Id</th>', 
		concat(user, '</td><td>') as '<th>User</th>', 
		concat(host, '</td><td>') as '<th>Host</th>', 
		concat(IFNULL(db, 'NULL'), '</td><td>') as '<th>Db</th>',
		concat(replace(command, '\'', ''), '</td><td>') as '<th>Command</th>', 
		concat(time, '</td><td>') as '<th>Time</th>',
		concat(replace(state, '\'', ''), '</td><td>') as '<th>State</th>',
		concat(replace(replace(replace(replace(IFNULL(info, 'NULL'), '<', '&lt;'), '>', '&gt;'),'\n', ''), '\t', ''), '</td></tr>') as '<th>Info</th></tr>'
		-- concat('<pre>', replace(replace(IFNULL(info, 'NULL'), '<', '&lt;'), '>', '&gt;'), '</pre></td></tr>') as '<th>Info</th></tr>'
	FROM 
		information_schema.processlist;
	select '' as '</table>';
	
	############### REDO LOG ################
	
	select '' as '<h1><a name="redolog">Redo Log</a></h1>';
	select '' as '<table>';
	select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',case  
	when variable_value >= 1073741824 then concat(variable_value/1024/1024/1024, ' Go')
	when variable_value >= 1048576 then concat(variable_value/1024/1024, ' Mo')
	when variable_value >= 1024 then concat(variable_value/1024, ' Ko')
	else concat(variable_value, ' octets') end,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name = 'innodb_log_buffer_size'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',case  
	when variable_value >= 1073741824 then concat(variable_value/1024/1024/1024, ' Go')
	when variable_value >= 1048576 then concat(variable_value/1024/1024, ' Mo')
	when variable_value >= 1024 then concat(variable_value/1024, ' Ko')
	else concat(variable_value, ' octets') end,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_log_file_size'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_log_files_in_group';
		
	select '' as '</table>';
	
	############### Dangerous parameter set ##############
	
	############### Statistics ################
	
	select '' as '<h1><a name="stat">Statistics</a></h1>';
	select '' as '<table>';
	select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name = 'innodb_stats_method'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_stats_on_metadata'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_stats_persistent'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_stats_persistent_sample_pages'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_stats_sample_pages'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_stats_transient_sample_pages';
		
	select '' as '</table>';
	
	############### IO ####################
	select '' as '<h1><a name="thread">I\O</a></h1>';
	select '' as '<table>';
	select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name = 'innodb_flush_method'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_read_io_threads'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_write_io_threads'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_io_capacity'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_io_capacity_max'
		UNION ALL
		select 
		concat('<tr><td>',VARIABLE_NAME) as '<tr><td>Name</td>', 
		concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<td>Value</td>' 
		from performance_schema.global_variables where variable_name ='innodb_use_native_io';
		
	select '' as '</table>';
	
	############### FULL PROCESS LIST #################
	select '' as '<h1><a name="thread">Session</a></h1>';
	select '' as '<table>';
	SELECT 
		concat('<tr><td>',id,'</td><td>') as '<tr><th>Id</th>', 
		concat(user, '</td><td>') as '<th>User</th>', 
		concat(host, '</td><td>') as '<th>Host</th>', 
		concat(IFNULL(db, 'NULL'), '</td><td>') as '<th>Db</th>',
		concat(replace(command, '\'', ''), '</td><td>') as '<th>Command</th>', 
		concat(time, '</td><td>') as '<th>Time</th>',
		concat(replace(state, '\'', ''), '</td><td>') as '<th>State</th>',
		concat(replace(replace(replace(replace(IFNULL(info, 'NULL'), '<', '&lt;'), '>', '&gt;'),'\n', ''), '\t', ''), '</td></tr>') as '<th>Info</th></tr>'
		-- concat('<pre>', replace(replace(IFNULL(info, 'NULL'), '<', '&lt;'), '>', '&gt;'), '</pre></td></tr>') as '<th>Info</th></tr>'
	FROM 
		information_schema.processlist;
	select '' as '</table>';
	
	-- ################ Security ###############
	select '' as '<h1><a name="security">Security</a></h1>';
	select '' as '<table>';
	-- IF @version_full <= '579' THEN
		SELECT 
			concat('<tr><td>', user, '</td><td>') as '<tr><th>User</th>',
			concat(host, '</td><td>') as '<th>host</th>',
			concat(authentication_string, '</td><td>') as '<th>Password</th>',
			concat(CASE WHEN Super_priv = 'Y' THEN 'Admin' ELSE '' END,'</td><td>') as '<th>Super</th>'
		FROM
			mysql.user;
	
	/*ELSE
		-- En 5.7 there is no passowrd field, need to know for old version if there is empty password
		
		SELECT 
			concat('<tr><td>', user, '</td><td>') as '<tr><th>User</th>',
			concat(host, '</td><td>') as '<th>host</th>',
			concat(CASE WHEN Super_priv = 'Y' THEN 'Admin' ELSE '' END,'</td><td>') as '<th>Super</th>'
		FROM
			mysql.user;
	END IF;*/	
	select '' as '</table>';
	
	
	/*select '' as '<table>';	
	select 
	concat('<tr><td>',VARIABLE_NAME) as '<tr><th>Name</th>', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '<th>Value</th>' 
	from performance_schema.global_variables where ( variable_name like '%binlog%' or variable_name like '%log_bin%') and variable_name not like '%com%'
	UNION ALL
	select 
	concat('<tr><td>',VARIABLE_NAME) as '', 
	concat('</td><td>',VARIABLE_VALUE,'</td></tr>') as '' 
	from performance_schema.global_status where variable_name like '%binlog%' and variable_name not like '%com%';
	select '' as '</table>';
	*/
	
	/*
	
	select '' as '<div id="tester" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>';
	
	select '' as '<script type="text/javascript">
	$(function () {';
	select '' as '$("#tester").css("background","red");';
		select '' as '$(\'#tester\').highcharts({';
			
	select '' as '
			series: [{
				type: \'pie\',name: \'Browser share\',data: [';
	
	-- select concat('["Total",' , @buffer_pool_total - , '],') as '';
	select concat(concat('["free",' , @buffer_pool_free), '],') as '';
	select concat(concat('["dirty",' , @buffer_pool_dirty), '],') as '';
	select concat(concat('["data",' , @buffer_pool_data), ']') as '';
				select '' as '
				]
			}]
		});
	});</script>';
	select '' as '</body></html>';
	
	-- select concat('Total : ',sum(data_length+index_length+data_free) from information_schema.tables
	-- get all path
	
	*/
	
	
	-- DROP TABLE MYSQL.TMPTEST;
	
	select '' as '</div></body></html>';
	
	

/*END//
delimiter ;
CALL mysql.mysqlsnap;
DROP PROCEDURE mysql.mysqlsnap;*/