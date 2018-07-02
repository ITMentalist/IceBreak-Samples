<%@ language="RPGLE" pgmtype="srvpgm" pgmopt="export(*ALL)" %>
<%
ctl-opt copyright('System & Method (C), 2016');
ctl-opt decEdit('0,') datEdit(*YMD.) nomain; 
ctl-opt bndDir('NOXDB' );
/* -----------------------------------------------------------------------------

  CRTICEPGM STMF('/www/IceBreak-Samples/msSimple.rpgle') SVRID(samples)


  By     Date       PTF     Description
  ------ ---------- ------- ---------------------------------------------------
  NLI    22.06.2016         New program
  ----------------------------------------------------------------------------- */
 /include noxDB
 /include qasphdr,iceUtility


/* -------------------------------------------------------------------- *\ 
   	The mother of all samples: hellow world
       
   	note the "action" can be either from the URL or by a selfcontained message:

	dksrv206:60060/router?payload={
		"action":"msSimple.Hello",
		"message" : "My name is John"
	}

	or by url:

	dksrv206:60060/router/msSimple/Hello?payload={
		"message" : "My name is John"
	}

\* -------------------------------------------------------------------- */
dcl-proc Hello export;

	dcl-pi *n pointer;
		pInput 			pointer value;
	end-pi;

	dcl-s  pOutput   	pointer;


    pOutput = json_newObject();

    json_setStr(pOutput: 'text' : 'Hello world ');
    json_setStr(pOutput: 'time' : %char(%timestamp()));
	json_setStr(pOutput: 'message' : json_getStr(pInput : 'message'));
	
	return pOutput;

end-proc;
// --------------------------------------------------------------------
/** 
   	Convert any positive integer to packed decimal for the command 
   	processor. The input can be int,packed, zoned, float.

   	@parm  input 	any positive interger value
	@parm  packLen 	any uneven number: 1, 3, 5, 7, 9, ...
	@return 		string in format:  x'0012345F' for strPack(12345:7)
   	
*/
// --------------------------------------------------------------------
dcl-proc strPack; 

	dcl-pi *n varchar(32);
		input 			int(20) value;
		packlen  		int(5) value;
	end-pi;

	dcl-s	temp 		varchar(32);

	temp = %char(1000000000000000000 + input);
	temp = %subst(temp:%len(temp)-packLen+1);
	temp = 'x''' + temp + 'F''';

	return temp;

end-proc;


/* -------------------------------------------------------------------- *\ 
   	The mother of all samples: hellow world
       
   	note the "action" can be either from the URL or by a selfcontained message:

	dksrv206:60060/router?payload={
		"action":"msSimple.HelloClarins",
		"message" : "My name is John"
	}

	or by url:

	dksrv206:60060/router/msSimple/HelloClarins?payload={
		"message" : "My name is John"
	}

\* -------------------------------------------------------------------- */
dcl-proc HelloClarins export;

	dcl-pi *n pointer;
		pInput 			pointer value;
	end-pi;


	dcl-s  pOutput   	pointer;
	dcl-s  john 		int(10);
	
	john = 123; 

    pOutput = json_newObject();

    json_setStr(pOutput: 'text' : 'Hello Clarins world ');
    json_setStr(pOutput: 'time' : %char(%timestamp()));
	json_setStr(pOutput: 'message' : json_getStr(pInput : 'message'));
	
	return pOutput;

end-proc;
	


/* -------------------------------------------------------------------- *\ 
   	The mother of all samples: hellow world
       
	dksrv206:60060/router?payload={
		"action":"msSimple.YX",
		"message" : "Hej med jer"
	}

\* -------------------------------------------------------------------- */
dcl-proc YX export;

	dcl-pi *n pointer;
		pInput 			pointer value;
	end-pi;

	dcl-s  pOutput   	pointer;
	
    pOutput = json_newObject();

    json_setStr(pOutput: 'text' : 'Hello world');
    json_setStr(pOutput: 'time' : %char(%timestamp()));
	json_setStr(pOutput: 'message' : json_getStr(pInput : 'message'));
	
	return pOutput;

end-proc;




/* -------------------------------------------------------------------- *\ 
   	The mother of all samples: hellow world
       
	dksrv206:60060/router?payload={
		"action":"msSimple.per",
		"message" : "My name is Per"
	}

\* -------------------------------------------------------------------- */
dcl-proc per  export;

	dcl-pi *n pointer;
		pInput 			pointer value;
	end-pi;

	dcl-s  pOutput   	pointer;
	
    pOutput = json_newObject();

    json_setStr(pOutput: 'text' : 'Hello world');
    json_setStr(pOutput: 'time' : %char(%timestamp()));
	json_setStr(pOutput: 'message' : json_getStr(pInput : 'message'));
	
	return pOutput;

end-proc;


/* -------------------------------------------------------------------- *\ 
   	The mother of all samples: hellow world
       
	dksrv206:60060/router?payload={
		"action":"msSimple.jeppe"
	}

\* -------------------------------------------------------------------- */
dcl-proc jeppe export;

	dcl-pi *n pointer;
		pInput 			pointer value;
	end-pi;

	dcl-s  i 			int(10) static;
	dcl-s  pOutput   	pointer;
	
    pOutput = json_newObject();

	i += 1;
    json_setInt(pOutput: 'i' : i);
	
	return pOutput;

end-proc;

/* -------------------------------------------------------------------- *\ 
   	returns sum of x and y

	dksrv206:60060/router?payload={
		"action":"msSimple.sum",
		"x": 123,
		"y": 456
	}

\* -------------------------------------------------------------------- */
dcl-proc sum export;

	dcl-pi *n pointer;
		pInput 				pointer value;
	end-pi;

	dcl-s  pOutput      	pointer;
	dcl-s  x      			int(10);
	dcl-s  y      			int(10);


    x = json_getnum(pInput : 'x');
    y = json_getnum(pInput : 'y');

    pOutput = json_newObject();
    json_setInt(pOutput : 'sum' : x + y);

	return pOutput;

end-proc;
/* -------------------------------------------------------------------- *\ 
   	division - can it handle divide by zero? 

	dksrv206:60060/router?payload={
		"action":"msSimple.divide",
		"x": 125,
		"y": 5
	}

\* -------------------------------------------------------------------- */
dcl-proc divide export;

	dcl-pi *n pointer;
		pInput 				pointer value;
	end-pi;

	dcl-s  pOutput      	pointer;
	dcl-s  x      			int(10);
	dcl-s  y      			int(10);


    x = json_getnum(pInput : 'x');
    y = json_getnum(pInput : 'y');

    pOutput = json_newObject();
    json_setInt(pOutput : 'divide' : x / y);

	return pOutput;

end-proc;
dcl-proc products export;

	dcl-pi *n pointer;
		pInput 				pointer value;
	end-pi;

	dcl-s  pResultSet     	pointer;
	dcl-s  sqlStmt        	varchar(4096);

   
	sqlStmt = (`
		select * 
		from product
	`);

	pResultSet = json_sqlResultSet   (
		sqlStmt
		: 1
		: 2000
		: JSON_META + JSON_TOTALROWS
	);


	return pResultSet;

end-proc;



