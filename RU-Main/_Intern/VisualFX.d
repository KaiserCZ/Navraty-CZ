
const int VFX_NUM_USERSTRINGS = 5;

class C_PARTICLEFXEMITKEY
{
	var string visname_s;
	var float vissizescale;
	var float scaleduration;
	var float pfx_ppsvalue;
	var int pfx_ppsissmoothchg;
	var int pfx_ppsisloopingchg;
	var float pfx_sctime;
	var string pfx_flygravity_s;
	var string pfx_shpdim_s;
	var int pfx_shpisvolumechg;
	var float pfx_shpscalefps;
	var float pfx_shpdistribwalkspeed;
	var string pfx_shpoffsetvec_s;
	var string pfx_shpdistribtype_s;
	var string pfx_dirmode_s;
	var string pfx_dirfor_s;
	var string pfx_dirmodetargetfor_s;
	var string pfx_dirmodetargetpos_s;
	var float pfx_velavg;
	var float pfx_lsppartavg;
	var float pfx_visalphastart;
	var string lightpresetname;
	var float lightrange;
	var string sfxid;
	var int sfxisambient;
	var string emcreatefxid;
	var float emflygravity;
	var string emselfrotvel_s;
	var string emtrjmode_s;
	var float emtrjeasevel;
	var int emcheckcollision;
	var float emfxlifespan;
};

class CFX_BASE
{
	var string visname_s;
	var string vissize_s;
	var float visalpha;
	var string visalphablendfunc_s;
	var float vistexanifps;
	var int vistexaniislooping;
	var string emtrjmode_s;
	var string emtrjoriginnode;
	var string emtrjtargetnode;
	var float emtrjtargetrange;
	var float emtrjtargetazi;
	var float emtrjtargetelev;
	var int emtrjnumkeys;
	var int emtrjnumkeysvar;
	var float emtrjangleelevvar;
	var float emtrjangleheadvar;
	var float emtrjkeydistvar;
	var string emtrjloopmode_s;
	var string emtrjeasefunc_s;
	var float emtrjeasevel;
	var float emtrjdynupdatedelay;
	var int emtrjdynupdatetargetonly;
	var string emfxcreate_s;
	var string emfxinvestorigin_s;
	var string emfxinvesttarget_s;
	var float emfxtriggerdelay;
	var int emfxcreatedowntrj;
	var string emactioncolldyn_s;
	var string emactioncollstat_s;
	var string emfxcollstat_s;
	var string emfxcolldyn_s;
	var string emfxcolldynperc_s;
	var string emfxcollstatalign_s;
	var string emfxcolldynalign_s;
	var float emfxlifespan;
	var int emcheckcollision;
	var int emadjustshptoorigin;
	var float eminvestnextkeyduration;
	var float emflygravity;
	var string emselfrotvel_s;
	var string userstring[5];
	var string lightpresetname;
	var string sfxid;
	var int sfxisambient;
	var int sendassessmagic;
	var float secsperdamage;
};

prototype CFX_BASE_PROTO(CFX_BASE)
{
	visname_s = "";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "";
	emtrjtargetrange = 10;
	emtrjtargetazi = 0;
	emtrjtargetelev = 0;
	emtrjnumkeys = 10;
	emtrjnumkeysvar = 0;
	emtrjangleelevvar = 0;
	emtrjangleheadvar = 0;
	emtrjkeydistvar = 0;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjeasevel = 100;
	emtrjdynupdatedelay = 2000000;
	emtrjdynupdatetargetonly = 0;
	emfxcreate_s = "";
	emfxtriggerdelay = 0;
	emfxcreatedowntrj = 0;
	emactioncolldyn_s = "";
	emactioncollstat_s = "";
	emfxcollstat_s = "";
	emfxcolldyn_s = "";
	emfxcolldynperc_s = "";
	emfxcollstatalign_s = "";
	emfxcolldynalign_s = "";
	emcheckcollision = 0;
	emadjustshptoorigin = 0;
	eminvestnextkeyduration = 0;
	emflygravity = 0;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	lightpresetname = "";
	sfxid = "";
	sendassessmagic = 0;
	secsperdamage = -1;
};
