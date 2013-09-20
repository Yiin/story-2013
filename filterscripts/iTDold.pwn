
#include <a_samp>
#include <pleoinput>
#include <ZCMD>
#include <sscanf2>

#define MAX_LOADED_TEXTDRAWS 	(100)
#define MAX_UNDO                (1000)

#define PROJECT_LIST            "/Projects.lst"
#define PROJECT_FILE            "/%s.iTD"

#define DIALOG_MANAGE 7314
#define DIALOG_OPEN   7315
#define DIALOG_NEW    7318
#define DIALOG_CREATE 7316
#define DIALOG_EDITTEXT 7317

#define TEXTDRAW_GLOBAL (0)
#define TEXTDRAW_PLAYER (1)

#define EDIT_MODE_CREATE_NORMAL (1)
#define EDIT_MODE_CREATE_UBOX   (2)
#define EDIT_MODE_CREATE_TBOX   (3)

#define EDIT_MODE_POSITION 		(4)
#define EDIT_MODE_SIZE 			(5)
#define EDIT_MODE_LETTERSIZE 	(6)
#define EDIT_MODE_COLOR 		(7)
#define EDIT_MODE_BGCOLOR 		(8)
#define EDIT_MODE_BOXCOLOR 		(9)
#define EDIT_MODE_OUTLINE       (10)
#define EDIT_MODE_SHADOW        (11)
#define EDIT_MODE_TEXT          (12)

#define COLOR_MODE_NONE         (0)
#define COLOR_MODE_RED          (1)
#define COLOR_MODE_GREEN        (2)
#define COLOR_MODE_BLUE         (3)
#define COLOR_MODE_ALPHA        (4)

#define DEFAULT_SPEED           (1.0)

#define ShowPlayerDialogX Dialog = true; ShowPlayerDialog

enum e_EDIT_DRAW
{
	Text:Id, TSTR[128],
	Float:cX, Float:cY,
	Float:lX, Float:lY,
	Float:tX, Float:tY,
	Al, Cl, Ub, Bc, Sd,
	Ol, Bg, Ft, Pr, Sl,
	tType
}

new
	ProjectEditor = -1, ProjectSaved = true, ProjectName[64],
	
	Text:TD_Menu[34] = {Text:INVALID_TEXT_DRAW, ...},
	Text:TD_Coord = Text:INVALID_TEXT_DRAW, stringll[48],
	
	bool:MenuShown, bool:TempHide, bool:EditEnabled, EditMode, CurrentID = -1,
	ColorMode, Color[4], EditDraw[MAX_LOADED_TEXTDRAWS][e_EDIT_DRAW],
	
	Float:EditSpeed = DEFAULT_SPEED,
	Str_Large[3584], Str_TextdrawData[512], Str_Normal[128], Str_Small[48],
	
	DialogResponse, Undo[MAX_UNDO][256],
	bool:Dialog
;

stock InitDrawMenu()
{
	for(new i = 0; i < MAX_LOADED_TEXTDRAWS; i++)
    EditDraw[i][Id] = Text:INVALID_TEXT_DRAW;
    
	new Text:Array[128];
	
	for(new i = 0; i < sizeof Array; i++)
	    Array[i] = TextDrawCreate(0, 0, " ");
	    
	TD_Coord = TextDrawCreate(15, 406, "X - 133.7~n~Y - 133.7~n~");
	TextDrawBackgroundColor(TD_Coord, 255);
	TextDrawFont(TD_Coord, 2);
	TextDrawLetterSize(TD_Coord, 0.306,1.407);
	TextDrawColor(TD_Coord, 51);
	TextDrawSetOutline(TD_Coord, 0);
	TextDrawSetProportional(TD_Menu[0], 1);
	TextDrawSetShadow(TD_Coord, 1);
	TextDrawUseBox(TD_Coord, 0);
	TextDrawBoxColor(TD_Coord, 255);
	TextDrawTextSize(TD_Coord, 200,200);
	    
    TD_Menu[0] = TextDrawCreate(214.000000, 136.000000, "PLEO:body");
	TextDrawBackgroundColor(TD_Menu[0], 255);
	TextDrawFont(TD_Menu[0], 4);
	TextDrawLetterSize(TD_Menu[0], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[0], -1);
	TextDrawSetOutline(TD_Menu[0], 0);
	TextDrawSetProportional(TD_Menu[0], 1);
	TextDrawSetShadow(TD_Menu[0], 1);
	TextDrawUseBox(TD_Menu[0], 1);
	TextDrawBoxColor(TD_Menu[0], 255);
	TextDrawTextSize(TD_Menu[0], 221.000000, 261.000000);

	TD_Menu[1] = TextDrawCreate(220.000000, 184.000000, "PLEO:btn_new");
	TextDrawBackgroundColor(TD_Menu[1], 255);
	TextDrawFont(TD_Menu[1], 4);
	TextDrawLetterSize(TD_Menu[1], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[1], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[1], 0);
	TextDrawSetProportional(TD_Menu[1], 1);
	TextDrawSetShadow(TD_Menu[1], 1);
	TextDrawUseBox(TD_Menu[1], 1);
	TextDrawBoxColor(TD_Menu[1], 255);
	TextDrawTextSize(TD_Menu[1], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[1], true);

	TD_Menu[2] = TextDrawCreate(261.000000, 184.000000, "PLEO:btn_open");
	TextDrawBackgroundColor(TD_Menu[2], 255);
	TextDrawFont(TD_Menu[2], 4);
	TextDrawLetterSize(TD_Menu[2], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[2], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[2], 0);
	TextDrawSetProportional(TD_Menu[2], 1);
	TextDrawSetShadow(TD_Menu[2], 1);
	TextDrawUseBox(TD_Menu[2], 1);
	TextDrawBoxColor(TD_Menu[2], 255);
	TextDrawTextSize(TD_Menu[2], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[2], true);

	TD_Menu[3] = TextDrawCreate(302.000000, 184.000000, "PLEO:btn_close");
	TextDrawBackgroundColor(TD_Menu[3], 255);
	TextDrawFont(TD_Menu[3], 4);
	TextDrawLetterSize(TD_Menu[3], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[3], 0x888888FF);
	TextDrawSetOutline(TD_Menu[3], 0);
	TextDrawSetProportional(TD_Menu[3], 1);
	TextDrawSetShadow(TD_Menu[3], 1);
	TextDrawUseBox(TD_Menu[3], 1);
	TextDrawBoxColor(TD_Menu[3], 255);
	TextDrawTextSize(TD_Menu[3], 44.000000, 44.000000);
	//TextDrawSetSelectable(TD_Menu[3], true);

	TD_Menu[4] = TextDrawCreate(343.000000, 184.000000, "PLEO:btn_export");
	TextDrawBackgroundColor(TD_Menu[4], 255);
	TextDrawFont(TD_Menu[4], 4);
	TextDrawLetterSize(TD_Menu[4], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[4], 0x888888FF);
	TextDrawSetOutline(TD_Menu[4], 0);
	TextDrawSetProportional(TD_Menu[4], 1);
	TextDrawSetShadow(TD_Menu[4], 1);
	TextDrawUseBox(TD_Menu[4], 1);
	TextDrawBoxColor(TD_Menu[4], 255);
	TextDrawTextSize(TD_Menu[4], 44.000000, 44.000000);
	//TextDrawSetSelectable(TD_Menu[4], true);

	TD_Menu[5] = TextDrawCreate(220.000000, 346.000000, "PLEO:btn_global");
	TextDrawBackgroundColor(TD_Menu[5], 255);
	TextDrawFont(TD_Menu[5], 4);
	TextDrawLetterSize(TD_Menu[5], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[5], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[5], 0);
	TextDrawSetProportional(TD_Menu[5], 1);
	TextDrawSetShadow(TD_Menu[5], 1);
	TextDrawUseBox(TD_Menu[5], 1);
	TextDrawBoxColor(TD_Menu[5], 255);
	TextDrawTextSize(TD_Menu[5], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[5], true);
	
	TD_Menu[33] = TextDrawCreate(220.000000, 346.000000, "PLEO:btn_player");
	TextDrawBackgroundColor(TD_Menu[33], 255);
	TextDrawFont(TD_Menu[33], 4);
	TextDrawLetterSize(TD_Menu[33], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[33], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[33], 0);
	TextDrawSetProportional(TD_Menu[33], 1);
	TextDrawSetShadow(TD_Menu[33], 1);
	TextDrawUseBox(TD_Menu[33], 1);
	TextDrawBoxColor(TD_Menu[33], 255);
	TextDrawTextSize(TD_Menu[33], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[33], true);

	TD_Menu[6] = TextDrawCreate(222.000000, 173.000000, "Project tools:");
	TextDrawBackgroundColor(TD_Menu[6], 255);
	TextDrawFont(TD_Menu[6], 1);
	TextDrawLetterSize(TD_Menu[6], 0.290000, 1.099999);
	TextDrawColor(TD_Menu[6], -1);
	TextDrawSetOutline(TD_Menu[6], 0);
	TextDrawSetProportional(TD_Menu[6], 1);
	TextDrawSetShadow(TD_Menu[6], 0);

	TD_Menu[7] = TextDrawCreate(222.000000, 234.000000, "Textdraw tools:");
	TextDrawBackgroundColor(TD_Menu[7], 255);
	TextDrawFont(TD_Menu[7], 1);
	TextDrawLetterSize(TD_Menu[7], 0.290000, 1.099999);
	TextDrawColor(TD_Menu[7], -1);
	TextDrawSetOutline(TD_Menu[7], 0);
	TextDrawSetProportional(TD_Menu[7], 1);
	TextDrawSetShadow(TD_Menu[7], 0);

	TD_Menu[8] = TextDrawCreate(384.000000, 184.000000, "PLEO:btn_manage");
	TextDrawBackgroundColor(TD_Menu[8], 255);
	TextDrawFont(TD_Menu[8], 4);
	TextDrawLetterSize(TD_Menu[8], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[8], 0x888888FF);
	TextDrawSetOutline(TD_Menu[8], 0);
	TextDrawSetProportional(TD_Menu[8], 1);
	TextDrawSetShadow(TD_Menu[8], 1);
	TextDrawUseBox(TD_Menu[8], 1);
	TextDrawBoxColor(TD_Menu[8], 255);
	TextDrawTextSize(TD_Menu[8], 44.000000, 44.000000);
	//TextDrawSetSelectable(TD_Menu[8], true);

	TD_Menu[9] = TextDrawCreate(261.000000, 245.000000, "PLEO:btn_pos");
	TextDrawBackgroundColor(TD_Menu[9], 255);
	TextDrawFont(TD_Menu[9], 4);
	TextDrawLetterSize(TD_Menu[9], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[9], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[9], 0);
	TextDrawSetProportional(TD_Menu[9], 1);
	TextDrawSetShadow(TD_Menu[9], 1);
	TextDrawUseBox(TD_Menu[9], 1);
	TextDrawBoxColor(TD_Menu[9], 255);
	TextDrawTextSize(TD_Menu[9], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[9], true);

	TD_Menu[10] = TextDrawCreate(302.000000, 245.000000, "PLEO:btn_size");
	TextDrawBackgroundColor(TD_Menu[10], 255);
	TextDrawFont(TD_Menu[10], 4);
	TextDrawLetterSize(TD_Menu[10], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[10], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[10], 0);
	TextDrawSetProportional(TD_Menu[10], 1);
	TextDrawSetShadow(TD_Menu[10], 1);
	TextDrawUseBox(TD_Menu[10], 1);
	TextDrawBoxColor(TD_Menu[10], 255);
	TextDrawTextSize(TD_Menu[10], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[10], true);

	TD_Menu[11] = TextDrawCreate(343.000000, 245.000000, "PLEO:btn_text");
	TextDrawBackgroundColor(TD_Menu[11], 255);
	TextDrawFont(TD_Menu[11], 4);
	TextDrawLetterSize(TD_Menu[11], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[11], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[11], 0);
	TextDrawSetProportional(TD_Menu[11], 1);
	TextDrawSetShadow(TD_Menu[11], 1);
	TextDrawUseBox(TD_Menu[11], 1);
	TextDrawBoxColor(TD_Menu[11], 255);
	TextDrawTextSize(TD_Menu[11], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[11], true);

	TD_Menu[12] = TextDrawCreate(220.000000, 245.000000, "PLEO:btn_image");
	TextDrawBackgroundColor(TD_Menu[12], 255);
	TextDrawFont(TD_Menu[12], 4);
	TextDrawLetterSize(TD_Menu[12], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[12], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[12], 0);
	TextDrawSetProportional(TD_Menu[12], 1);
	TextDrawSetShadow(TD_Menu[12], 1);
	TextDrawUseBox(TD_Menu[12], 1);
	TextDrawBoxColor(TD_Menu[12], 255);
	TextDrawTextSize(TD_Menu[12], 44.000000, 44.000000);
    TextDrawSetSelectable(TD_Menu[12], true);

	TD_Menu[13] = TextDrawCreate(222.000000, 334.000000, "Textdraw Toggles:");
	TextDrawBackgroundColor(TD_Menu[13], 255);
	TextDrawFont(TD_Menu[13], 1);
	TextDrawLetterSize(TD_Menu[13], 0.290000, 1.099999);
	TextDrawColor(TD_Menu[13], -1);
	TextDrawSetOutline(TD_Menu[13], 0);
	TextDrawSetProportional(TD_Menu[13], 1);
	TextDrawSetShadow(TD_Menu[13], 0);

	TD_Menu[14] = TextDrawCreate(220.000000, 286.000000, "PLEO:btn_color");
	TextDrawBackgroundColor(TD_Menu[14], 255);
	TextDrawFont(TD_Menu[14], 4);
	TextDrawLetterSize(TD_Menu[14], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[14], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[14], 0);
	TextDrawSetProportional(TD_Menu[14], 1);
	TextDrawSetShadow(TD_Menu[14], 1);
	TextDrawUseBox(TD_Menu[14], 1);
	TextDrawBoxColor(TD_Menu[14], 255);
	TextDrawTextSize(TD_Menu[14], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[14], true);

	TD_Menu[15] = TextDrawCreate(261.000000, 286.000000, "PLEO:btn_bgcolor");
	TextDrawBackgroundColor(TD_Menu[15], 255);
	TextDrawFont(TD_Menu[15], 4);
	TextDrawLetterSize(TD_Menu[15], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[15], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[15], 0);
	TextDrawSetProportional(TD_Menu[15], 1);
	TextDrawSetShadow(TD_Menu[15], 1);
	TextDrawUseBox(TD_Menu[15], 1);
	TextDrawBoxColor(TD_Menu[15], 255);
	TextDrawTextSize(TD_Menu[15], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[15], true);

	TD_Menu[16] = TextDrawCreate(384.000000, 245.000000, "PLEO:btn_lettersize");
	TextDrawBackgroundColor(TD_Menu[16], 255);
	TextDrawFont(TD_Menu[16], 4);
	TextDrawLetterSize(TD_Menu[16], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[16], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[16], 0);
	TextDrawSetProportional(TD_Menu[16], 1);
	TextDrawSetShadow(TD_Menu[16], 1);
	TextDrawUseBox(TD_Menu[16], 1);
	TextDrawBoxColor(TD_Menu[16], 255);
	TextDrawTextSize(TD_Menu[16], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[16], true);

	TD_Menu[17] = TextDrawCreate(343.000000, 286.000000, "PLEO:btn_outline");
	TextDrawBackgroundColor(TD_Menu[17], 255);
	TextDrawFont(TD_Menu[17], 4);
	TextDrawLetterSize(TD_Menu[17], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[17], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[17], 0);
	TextDrawSetProportional(TD_Menu[17], 1);
	TextDrawSetShadow(TD_Menu[17], 1);
	TextDrawUseBox(TD_Menu[17], 1);
	TextDrawBoxColor(TD_Menu[17], 255);
	TextDrawTextSize(TD_Menu[17], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[17], true);

	TD_Menu[18] = TextDrawCreate(384.000000, 286.000000, "PLEO:btn_shadow");
	TextDrawBackgroundColor(TD_Menu[18], 255);
	TextDrawFont(TD_Menu[18], 4);
	TextDrawLetterSize(TD_Menu[18], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[18], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[18], 0);
	TextDrawSetProportional(TD_Menu[18], 1);
	TextDrawSetShadow(TD_Menu[18], 1);
	TextDrawUseBox(TD_Menu[18], 1);
	TextDrawBoxColor(TD_Menu[18], 255);
	TextDrawTextSize(TD_Menu[18], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[18], true);

	TD_Menu[19] = TextDrawCreate(302.000000, 346.000000, "PLEO:btn_useboxno");
	TextDrawBackgroundColor(TD_Menu[19], 255);
	TextDrawFont(TD_Menu[19], 4);
	TextDrawLetterSize(TD_Menu[19], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[19], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[19], 0);
	TextDrawSetProportional(TD_Menu[19], 1);
	TextDrawSetShadow(TD_Menu[19], 1);
	TextDrawUseBox(TD_Menu[19], 1);
	TextDrawBoxColor(TD_Menu[19], 255);
	TextDrawTextSize(TD_Menu[19], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[19], true);

	TD_Menu[20] = TextDrawCreate(302.000000, 346.000000, "PLEO:btn_useboxyes");
	TextDrawBackgroundColor(TD_Menu[20], 255);
	TextDrawFont(TD_Menu[20], 4);
	TextDrawLetterSize(TD_Menu[20], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[20], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[20], 0);
	TextDrawSetProportional(TD_Menu[20], 1);
	TextDrawSetShadow(TD_Menu[20], 1);
	TextDrawUseBox(TD_Menu[20], 1);
	TextDrawBoxColor(TD_Menu[20], 255);
	TextDrawTextSize(TD_Menu[20], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[20], true);

	TD_Menu[21] = TextDrawCreate(261.000000, 346.000000, "PLEO:btn_alignmentleft");
	TextDrawBackgroundColor(TD_Menu[21], 255);
	TextDrawFont(TD_Menu[21], 4);
	TextDrawLetterSize(TD_Menu[21], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[21], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[21], 0);
	TextDrawSetProportional(TD_Menu[21], 1);
	TextDrawSetShadow(TD_Menu[21], 1);
	TextDrawUseBox(TD_Menu[21], 1);
	TextDrawBoxColor(TD_Menu[21], 255);
	TextDrawTextSize(TD_Menu[21], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[21], true);

	TD_Menu[22] = TextDrawCreate(261.000000, 346.000000, "PLEO:btn_alignmentcenter");
	TextDrawBackgroundColor(TD_Menu[22], 255);
	TextDrawFont(TD_Menu[22], 4);
	TextDrawLetterSize(TD_Menu[22], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[22], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[22], 0);
	TextDrawSetProportional(TD_Menu[22], 1);
	TextDrawSetShadow(TD_Menu[22], 1);
	TextDrawUseBox(TD_Menu[22], 1);
	TextDrawBoxColor(TD_Menu[22], 255);
	TextDrawTextSize(TD_Menu[22], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[22], true);

	TD_Menu[23] = TextDrawCreate(261.000000, 346.000000, "PLEO:btn_alignmentright");
	TextDrawBackgroundColor(TD_Menu[23], 255);
	TextDrawFont(TD_Menu[23], 4);
	TextDrawLetterSize(TD_Menu[23], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[23], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[23], 0);
	TextDrawSetProportional(TD_Menu[23], 1);
	TextDrawSetShadow(TD_Menu[23], 1);
	TextDrawUseBox(TD_Menu[23], 1);
	TextDrawBoxColor(TD_Menu[23], 255);
	TextDrawTextSize(TD_Menu[23], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[23], true);

	TD_Menu[24] = TextDrawCreate(220.000000, 245.000000, "PLEO:btn_font0");
	TextDrawBackgroundColor(TD_Menu[24], 255);
	TextDrawFont(TD_Menu[24], 4);
	TextDrawLetterSize(TD_Menu[24], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[24], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[24], 0);
	TextDrawSetProportional(TD_Menu[24], 1);
	TextDrawSetShadow(TD_Menu[24], 1);
	TextDrawUseBox(TD_Menu[24], 1);
	TextDrawBoxColor(TD_Menu[24], 255);
	TextDrawTextSize(TD_Menu[24], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[24], true);

	TD_Menu[25] = TextDrawCreate(220.000000, 245.000000, "PLEO:btn_font1");
	TextDrawBackgroundColor(TD_Menu[25], 255);
	TextDrawFont(TD_Menu[25], 4);
	TextDrawLetterSize(TD_Menu[25], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[25], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[25], 0);
	TextDrawSetProportional(TD_Menu[25], 1);
	TextDrawSetShadow(TD_Menu[25], 1);
	TextDrawUseBox(TD_Menu[25], 1);
	TextDrawBoxColor(TD_Menu[25], 255);
	TextDrawTextSize(TD_Menu[25], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[25], true);

	TD_Menu[26] = TextDrawCreate(220.000000, 245.000000, "PLEO:btn_font2");
	TextDrawBackgroundColor(TD_Menu[26], 255);
	TextDrawFont(TD_Menu[26], 4);
	TextDrawLetterSize(TD_Menu[26], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[26], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[26], 0);
	TextDrawSetProportional(TD_Menu[26], 1);
	TextDrawSetShadow(TD_Menu[26], 1);
	TextDrawUseBox(TD_Menu[26], 1);
	TextDrawBoxColor(TD_Menu[26], 255);
	TextDrawTextSize(TD_Menu[26], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[26], true);

	TD_Menu[27] = TextDrawCreate(220.000000, 245.000000, "PLEO:btn_font3");
	TextDrawBackgroundColor(TD_Menu[27], 255);
	TextDrawFont(TD_Menu[27], 4);
	TextDrawLetterSize(TD_Menu[27], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[27], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[27], 0);
	TextDrawSetProportional(TD_Menu[27], 1);
	TextDrawSetShadow(TD_Menu[27], 1);
	TextDrawUseBox(TD_Menu[27], 1);
	TextDrawBoxColor(TD_Menu[27], 255);
	TextDrawTextSize(TD_Menu[27], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[27], true);

	TD_Menu[28] = TextDrawCreate(343.000000, 346.000000, "PLEO:btn_selectableno");
	TextDrawBackgroundColor(TD_Menu[28], 255);
	TextDrawFont(TD_Menu[28], 4);
	TextDrawLetterSize(TD_Menu[28], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[28], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[28], 0);
	TextDrawSetProportional(TD_Menu[28], 1);
	TextDrawSetShadow(TD_Menu[28], 1);
	TextDrawUseBox(TD_Menu[28], 1);
	TextDrawBoxColor(TD_Menu[28], 255);
	TextDrawTextSize(TD_Menu[28], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[28], true);

	TD_Menu[29] = TextDrawCreate(343.000000, 346.000000, "PLEO:btn_selectableyes");
	TextDrawBackgroundColor(TD_Menu[29], 255);
	TextDrawFont(TD_Menu[29], 4);
	TextDrawLetterSize(TD_Menu[29], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[29], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[29], 0);
	TextDrawSetProportional(TD_Menu[29], 1);
	TextDrawSetShadow(TD_Menu[29], 1);
	TextDrawUseBox(TD_Menu[29], 1);
	TextDrawBoxColor(TD_Menu[29], 255);
	TextDrawTextSize(TD_Menu[29], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[29], true);

	TD_Menu[30] = TextDrawCreate(384.000000, 346.000000, "PLEO:btn_proportionno");
	TextDrawBackgroundColor(TD_Menu[30], 255);
	TextDrawFont(TD_Menu[30], 4);
	TextDrawLetterSize(TD_Menu[30], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[30], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[30], 0);
	TextDrawSetProportional(TD_Menu[30], 1);
	TextDrawSetShadow(TD_Menu[30], 1);
	TextDrawUseBox(TD_Menu[30], 1);
	TextDrawBoxColor(TD_Menu[30], 255);
	TextDrawTextSize(TD_Menu[30], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[30], true);

	TD_Menu[31] = TextDrawCreate(384.000000, 346.000000, "PLEO:btn_proportionyes");
	TextDrawBackgroundColor(TD_Menu[31], 255);
	TextDrawFont(TD_Menu[31], 4);
	TextDrawLetterSize(TD_Menu[31], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[31], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[31], 0);
	TextDrawSetProportional(TD_Menu[31], 1);
	TextDrawSetShadow(TD_Menu[31], 1);
	TextDrawUseBox(TD_Menu[31], 1);
	TextDrawBoxColor(TD_Menu[31], 255);
	TextDrawTextSize(TD_Menu[31], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[31], true);

	TD_Menu[32] = TextDrawCreate(302.000000, 286.000000, "PLEO:btn_boxcolor");
	TextDrawBackgroundColor(TD_Menu[32], 255);
	TextDrawFont(TD_Menu[32], 4);
	TextDrawLetterSize(TD_Menu[32], 0.500000, 1.000000);
	TextDrawColor(TD_Menu[32], 0xDDDDDDFF);
	TextDrawSetOutline(TD_Menu[32], 0);
	TextDrawSetProportional(TD_Menu[32], 1);
	TextDrawSetShadow(TD_Menu[32], 1);
	TextDrawUseBox(TD_Menu[32], 1);
	TextDrawBoxColor(TD_Menu[32], 255);
	TextDrawTextSize(TD_Menu[32], 44.000000, 44.000000);
	TextDrawSetSelectable(TD_Menu[32], true);

    for(new i = 0; i < sizeof Array; i++)
	    TextDrawDestroy(Array[i]);
}

stock DestroyDrawMenu()
{
	for(new i = 0; i < sizeof TD_Menu; i++)
	    TextDrawDestroy(TD_Menu[i]);
}

stock HideDrawMenu(playerid)
{
	TogglePlayerControllable(playerid, true);
    
    for(new i = 0; i < MAX_LOADED_TEXTDRAWS; i++)
	    TextDrawShowForPlayer(playerid, EditDraw[i][Id]);
	    
	for(new i = 0; i < sizeof TD_Menu; i++)
	    TextDrawHideForPlayer(playerid, TD_Menu[i]);

	CancelSelectTextDraw(playerid);
	MenuShown = false;
	ProjectEditor = -1;
    TempHide = false;
    Dialog = false;
}

stock TempHideMenu(playerid)
{
    for(new i = 0; i < MAX_LOADED_TEXTDRAWS; i++)
	    TextDrawShowForPlayer(playerid, EditDraw[i][Id]);
	    
    for(new i = 0; i < sizeof TD_Menu; i++)
	    TextDrawHideForPlayer(playerid, TD_Menu[i]);
	    
    TempHide = true;
}

/******************************************************************************/

new
	ScreenWidth, ScreenHeight,
	MouseOldX, MouseOldY,
	MouseNewX, MouseNewY,
	bool:LMB_Pressed,
	bool:RMB_Pressed,
	bool:SPACE_Pressed,
	bool:SHIFT_Pressed,
	
	//Hotkeys:
	bool:C_Pressed, //Copy
	bool:Z_Pressed, //Undo
	
	bool:F_Pressed, //Font
	bool:P_Pressed, //Pos
	bool:S_Pressed, //Size
	bool:Y_Pressed, //Text
	bool:L_Pressed, //Letter
	bool:Q_Pressed, //Color
	bool:B_Pressed, //Background
	bool:U_Pressed, //Box
	bool:I_Pressed, //BoxColor
	bool:O_Pressed, //Outline
	bool:W_Pressed, //Shadow
	bool:G_Pressed, //Global/Player
	bool:A_Pressed, //Alignment
	bool:K_Pressed, //Select
	bool:R_Pressed, //Propor,
	bool:M_Pressed, //Menu
	bool:N_Pressed //New
;

forward VirtualKeyUpdate();
public VirtualKeyUpdate()
{
    if(!MenuShown) return true;
    
    GetScreenSize(ScreenWidth, ScreenHeight);
	GetMousePos(MouseNewX, MouseNewY);

	if(MouseOldX != MouseNewX || MouseOldY != MouseNewY)
	OnMousePositionChange(MouseNewX, MouseNewY);

	MouseOldX = MouseNewX, MouseOldY = MouseNewY;

	// To bo honest, I could map keys dynamically in the plugin itself
	// But I was too lazy. What can be easier than copy pasting?

    if(GetVirtualKeyState(VK_KEY_M)) { if(!M_Pressed) M_Pressed = true, OnButtonDown(VK_KEY_M); }
	else M_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_N)) { if(!N_Pressed) N_Pressed = true, OnButtonDown(VK_KEY_N); }
	else N_Pressed = false;

	if(GetVirtualKeyState(VK_KEY_F)) { if(!F_Pressed) F_Pressed = true, OnButtonDown(VK_KEY_F); }
	else F_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_P)) { if(!P_Pressed) P_Pressed = true, OnButtonDown(VK_KEY_P); }
	else P_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_S)) { if(!S_Pressed) S_Pressed = true, OnButtonDown(VK_KEY_S); }
	else S_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_Y)) { if(!Y_Pressed) Y_Pressed = true, OnButtonDown(VK_KEY_Y); }
	else Y_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_L)) { if(!L_Pressed) L_Pressed = true, OnButtonDown(VK_KEY_L); }
	else L_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_Q)) { if(!Q_Pressed) Q_Pressed = true, OnButtonDown(VK_KEY_Q); }
	else Q_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_B)) { if(!B_Pressed) B_Pressed = true, OnButtonDown(VK_KEY_B); }
	else B_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_U)) { if(!U_Pressed) U_Pressed = true, OnButtonDown(VK_KEY_U); }
	else U_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_I)) { if(!I_Pressed) I_Pressed = true, OnButtonDown(VK_KEY_I); }
	else I_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_O)) { if(!O_Pressed) O_Pressed = true, OnButtonDown(VK_KEY_O); }
	else O_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_W)) { if(!W_Pressed) W_Pressed = true, OnButtonDown(VK_KEY_W); }
	else W_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_G)) { if(!G_Pressed) G_Pressed = true, OnButtonDown(VK_KEY_G); }
	else G_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_A)) { if(!A_Pressed) A_Pressed = true, OnButtonDown(VK_KEY_A); }
	else A_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_K)) { if(!K_Pressed) K_Pressed = true, OnButtonDown(VK_KEY_K); }
	else K_Pressed = false;
	
	if(GetVirtualKeyState(VK_KEY_R)) { if(!R_Pressed) R_Pressed = true, OnButtonDown(VK_KEY_R); }
	else R_Pressed = false;
	

    if(GetVirtualKeyState(VK_KEY_C))
	{
		if(!C_Pressed)
		{
		    OnButtonDown(VK_KEY_C);
		    C_Pressed = true;
		}
	} else {
		if(C_Pressed)
		{
			OnButtonRelease(VK_KEY_C);
		    C_Pressed = false;
		}
	}

    if(GetVirtualKeyState(VK_KEY_Z))
	{
		if(!Z_Pressed)
		{
		    OnButtonDown(VK_KEY_Z);
		    Z_Pressed = true;
		}
	} else {
		if(Z_Pressed)
		{
			OnButtonRelease(VK_KEY_Z);
		    Z_Pressed = false;
		}
	}

	if(GetVirtualKeyState(VK_LBUTTON))
	{
		if(!LMB_Pressed)
		{
		    OnButtonDown(VK_LBUTTON);
		    LMB_Pressed = true;
		}
	} else {
		if(LMB_Pressed)
		{
			OnButtonRelease(VK_LBUTTON);
		    LMB_Pressed = false;
		}
	}

	if(GetVirtualKeyState(VK_RBUTTON))
	{
		if(!RMB_Pressed)
		{
		    OnButtonDown(VK_RBUTTON);
		    RMB_Pressed = true;
		}
	} else {
		if(RMB_Pressed)
		{
			OnButtonRelease(VK_RBUTTON);
		    RMB_Pressed = false;
		}
	}
	
	if(GetVirtualKeyState(VK_LSHIFT))
	{
		if(!SHIFT_Pressed)
		{
		    OnButtonDown(VK_LSHIFT);
		    SHIFT_Pressed = true;
		}
	} else {
		if(SHIFT_Pressed)
		{
			OnButtonRelease(VK_LSHIFT);
		    SHIFT_Pressed = false;
		}
	}
	
	if(GetVirtualKeyState(VK_SPACE))
	{
		if(!SPACE_Pressed)
		{
		    OnButtonDown(VK_SPACE);
		    SPACE_Pressed = true;
		}
	} else {
		if(SPACE_Pressed)
		{
			OnButtonRelease(VK_SPACE);
		    SPACE_Pressed = false;
		}
	}
	return true;
}

forward OnButtonDown(VK_KEY);
public OnButtonDown(VK_KEY)
{
	if(!EditEnabled && ProjectEditor != -1 && !Dialog && TempHide && MenuShown)
	{
	    switch(VK_KEY)
	    {
         	case VK_KEY_Z:
         	{
         	    if(0 < EditMode < 4) EditMode = EDIT_MODE_POSITION;
         	    ApplyUndo();
         	}
	        case VK_KEY_M: ListTexdraws(ProjectEditor);
	        case VK_KEY_N:
	        {
	            ShowPlayerDialogX(ProjectEditor, DIALOG_CREATE, DIALOG_STYLE_LIST, "Add a textdraw:",
				"+ Create Normal Textdraw\n\
				+ Create Box (Uses \"TextDrawUseBox\" method)\n\
				+ Create Texture Box (uses \"LD_SPAC:white\" texture)",
				"OK", "Back");
	        }
	    }
	    if(CurrentID != -1)
	    {
		if(EditDraw[CurrentID][Id] != Text:INVALID_TEXT_DRAW)
		{
		    switch(VK_KEY)
		    {
		        case VK_KEY_X:
		        {
			        SaveUndo(CurrentID);
			        format(Str_Normal, sizeof Str_Normal, "Project: {FF0000}TextDraw (%i){FFFFFF} deleted.", CurrentID);
					SendClientMessage(ProjectEditor, -1, Str_Normal);
			        RemoveTextDraw(CurrentID);
		        }
		        case VK_KEY_C:
		        {
		            new ID = GetAvailableIndex();
		            if(ID == -1)
					return SendClientMessage(ProjectEditor, -1, "Project: Unable to copy & create a new textdraw (Exceeds Limit)");

		            format(EditDraw[ID][TSTR], 128, "%s", EditDraw[CurrentID][TSTR]);
		            EditDraw[ID][cX] = EditDraw[CurrentID][cX] + 0.5;
		            EditDraw[ID][cY] = EditDraw[CurrentID][cY] + 0.5;
		            EditDraw[ID][lX] = EditDraw[CurrentID][lX];
		            EditDraw[ID][lY] = EditDraw[CurrentID][lY];
		            EditDraw[ID][tX] = EditDraw[CurrentID][tX];
		            EditDraw[ID][tY] = EditDraw[CurrentID][tY];
		            EditDraw[ID][Al] = EditDraw[CurrentID][Al];
		            EditDraw[ID][Cl] = EditDraw[CurrentID][Cl];
		            EditDraw[ID][Ub] = EditDraw[CurrentID][Ub];
		            EditDraw[ID][Bc] = EditDraw[CurrentID][Bc];
		            EditDraw[ID][Sd] = EditDraw[CurrentID][Sd];
		            EditDraw[ID][Ol] = EditDraw[CurrentID][Ol];
		            EditDraw[ID][Bg] = EditDraw[CurrentID][Bg];
		            EditDraw[ID][Ft] = EditDraw[CurrentID][Ft];
		            EditDraw[ID][Pr] = EditDraw[CurrentID][Pr];
		            EditDraw[ID][Sl] = EditDraw[CurrentID][Sl];

		            CurrentID = ID;
		            SaveUndo(CurrentID, 1);
		            RecreateTextDraw();
		            SendClientMessage(ProjectEditor, -1, "Project: Textdraw {FFFF00}Copied{FFFFFF}!");
		        }
		        case VK_KEY_F: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[27]);
		        case VK_KEY_P: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[9]);
		        case VK_KEY_S: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[10]);
		        case VK_KEY_Y: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[11]);
		        case VK_KEY_L: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[16]);
		        case VK_KEY_Q: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[14]);
		        case VK_KEY_B: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[15]);
		        case VK_KEY_U: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[19]);
		        case VK_KEY_I: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[32]);
		        case VK_KEY_O: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[17]);
		        case VK_KEY_W: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[18]);
		        case VK_KEY_G: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[5]);
		        case VK_KEY_A: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[23]);
		        case VK_KEY_K: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[29]);
		        case VK_KEY_R: OnPlayerClickTextDraw(ProjectEditor, TD_Menu[30]);
		    }
		}
		}
	}

	if(VK_KEY == VK_LBUTTON)
	{
	    switch(EditMode)
	    {
	        case EDIT_MODE_COLOR, EDIT_MODE_BOXCOLOR, EDIT_MODE_BGCOLOR:
	        {
	            SaveUndo(CurrentID);
	            
	            if(!MouseNewX && (0 < MouseNewY < (ScreenHeight - 1)) && ColorMode != COLOR_MODE_RED)
				ColorMode = COLOR_MODE_RED;
				
	            if(MouseNewX == (ScreenWidth - 1) && (0 < MouseNewY < (ScreenHeight - 1)) && ColorMode != COLOR_MODE_BLUE)
				ColorMode = COLOR_MODE_BLUE;
				
	            if(!MouseNewY && (0 < MouseNewX < (ScreenWidth - 1)) && ColorMode != COLOR_MODE_GREEN)
				ColorMode = COLOR_MODE_GREEN;
				
	            if(MouseNewY == (ScreenHeight - 1) && (0 < MouseNewX < (ScreenWidth - 1)) && ColorMode != COLOR_MODE_ALPHA)
				ColorMode = COLOR_MODE_ALPHA;

				OnMousePositionChange(MouseNewX, MouseNewY);
	            EditEnabled = true;
	        }
	        case EDIT_MODE_CREATE_NORMAL:
	        {
	            if(EditDraw[CurrentID][Id] == Text:INVALID_TEXT_DRAW) SaveUndo(CurrentID, 1);
	            
	            format(EditDraw[CurrentID][TSTR], 128, "NewTextdraw");
	            EditDraw[CurrentID][cX] = floatdiv(MouseNewX, ScreenWidth) * 640.0;
			    EditDraw[CurrentID][cY] = floatdiv(MouseNewY, ScreenHeight) * 448.0;
	            EditDraw[CurrentID][lX] = 0.45, EditDraw[CurrentID][lY] = 1.6;
	            EditDraw[CurrentID][Cl] = 0xFFFFFFFF;
			    EditDraw[CurrentID][Bg] = 51;
			    EditDraw[CurrentID][Ft] = 1;
			    EditDraw[CurrentID][Ol] = 1;
			    EditDraw[CurrentID][Pr] = 1;
			    EditDraw[CurrentID][Al] = 1;
			    
	            RecreateTextDraw();
	            EditMode = EDIT_MODE_POSITION;
	            EditEnabled = true;
	        }
	        case EDIT_MODE_POSITION, EDIT_MODE_SIZE, EDIT_MODE_LETTERSIZE, EDIT_MODE_OUTLINE, EDIT_MODE_SHADOW:
			{
			    SaveUndo(CurrentID);
			    TextDrawShowForPlayer(0,TD_Coord);
				EditEnabled = true;
			}
			case EDIT_MODE_CREATE_TBOX:
			{
			    if(EditDraw[CurrentID][Id] == Text:INVALID_TEXT_DRAW) SaveUndo(CurrentID, 1);
			    
			    format(EditDraw[CurrentID][TSTR], 128, "LD_SPAC:white");
			    EditDraw[CurrentID][Al] = 1;
			    EditDraw[CurrentID][Ft] = 4;
			    EditDraw[CurrentID][cX] = floatdiv(MouseNewX, ScreenWidth) * 640.0;
			    EditDraw[CurrentID][cY] = floatdiv(MouseNewY, ScreenHeight) * 448.0;
			    EditDraw[CurrentID][Cl] = 0xFFFFFFFF;
			    EditEnabled = true;
			}
			case EDIT_MODE_CREATE_UBOX:
			{
			    if(EditDraw[CurrentID][Id] == Text:INVALID_TEXT_DRAW) SaveUndo(CurrentID, 1);
			    
				format(EditDraw[CurrentID][TSTR], 128, "box");
				EditDraw[CurrentID][Al] = 1;
				EditDraw[CurrentID][Bc] = 0x00000066;
				EditDraw[CurrentID][Ub] = 1;
				
				EditDraw[CurrentID][cX] = (floatdiv(MouseNewX, ScreenWidth) * 640.0) - 2.0;
				EditDraw[CurrentID][cY] = (floatdiv(MouseNewY, ScreenHeight) * 448.0) + 1.5;
				EditDraw[CurrentID][tX] = EditDraw[CurrentID][cX];
				EditDraw[CurrentID][lX] = 0.0;
				
				EditDraw[CurrentID][lY] = 0.0;
				
			    EditEnabled = true;
			}
	    }
	}
	if(VK_KEY == VK_RBUTTON)
	{
	    switch(EditMode)
	    {
	        case EDIT_MODE_OUTLINE: { SaveUndo(CurrentID); EditDraw[CurrentID][Ol] = 0; RecreateTextDraw(); }
	        case EDIT_MODE_SHADOW: { SaveUndo(CurrentID); EditDraw[CurrentID][Sd] = 0; RecreateTextDraw(); }
	    }
	}
	if(VK_KEY == VK_SPACE) EditSpeed = 0.1;
	if(VK_KEY == VK_LSHIFT) EditSpeed = 5.0;
	return true;
}

forward OnButtonRelease(VK_KEY);
public OnButtonRelease(VK_KEY)
{
	if(VK_KEY == VK_LBUTTON)
	{
	    if(EditEnabled)
	    {
	        if(ColorMode) ColorMode = 0;
	        EditEnabled = false;
	        TextDrawHideForPlayer(0, TD_Coord);
	        SaveProject(ProjectName);
	    }
	}
	if(VK_KEY == VK_SPACE || VK_KEY == VK_LSHIFT) EditSpeed = DEFAULT_SPEED;
	return true;
}

stock RGBAToHex(r, g, b, a) //By Betamaster
{
    return (r<<24 | g<<16 | b<<8 | a);
}

stock HexToRGBA(colour, &r, &g, &b, &a) //By Betamaster
{
    r = (colour >> 24) & 0xFF;
    g = (colour >> 16) & 0xFF;
    b = (colour >> 8) & 0xFF;
    a = colour & 0xFF;
}

forward OnMousePositionChange(X, Y);
public OnMousePositionChange(X, Y)
{
	if(EditEnabled)
	{
	    switch(EditMode)
	    {
	        case EDIT_MODE_COLOR:
	        {
	            HexToRGBA(EditDraw[CurrentID][Cl], Color[0], Color[1], Color[2], Color[3]);
	            switch(ColorMode)
	            {
	                case COLOR_MODE_RED: Color[0] = floatround(  floatdiv((Y - 1), (ScreenHeight - 2)) * 255.0  );
	                case COLOR_MODE_GREEN: Color[1] = floatround(  floatdiv((X - 1), (ScreenWidth - 2)) * 255.0  );
                    case COLOR_MODE_BLUE: Color[2] = floatround(  floatdiv((Y - 1), (ScreenHeight - 2)) * 255.0 );
                    case COLOR_MODE_ALPHA: Color[3] = floatround(  floatdiv((X - 1), (ScreenWidth - 2)) * 255.0  );
				}
				format(Str_Small, sizeof Str_Small, "~n~~r~R%i~n~~g~G%i~n~~b~B%i~n~~w~A%i", Color[0], Color[1], Color[2], Color[3]);
				GameTextForPlayer(ProjectEditor, Str_Small, 1000, 3);
	            EditDraw[CurrentID][Cl] = RGBAToHex(Color[0], Color[1], Color[2], Color[3]);
	            RecreateTextDraw();
	        }
	        case EDIT_MODE_BGCOLOR:
	        {
	            HexToRGBA(EditDraw[CurrentID][Bg], Color[0], Color[1], Color[2], Color[3]);
	            switch(ColorMode)
	            {
	                case COLOR_MODE_RED: Color[0] = floatround(  floatdiv((Y - 1), (ScreenHeight - 2)) * 255.0  );
	                case COLOR_MODE_GREEN: Color[1] = floatround(  floatdiv((X - 1), (ScreenWidth - 2)) * 255.0  );
                    case COLOR_MODE_BLUE: Color[2] = floatround(  floatdiv((Y - 1), (ScreenHeight - 2)) * 255.0 );
                    case COLOR_MODE_ALPHA: Color[3] = floatround(  floatdiv((X - 1), (ScreenWidth - 2)) * 255.0  );
				}
				format(Str_Small, sizeof Str_Small, "~n~~r~R%i~n~~g~G%i~n~~b~B%i~n~~w~A%i", Color[0], Color[1], Color[2], Color[3]);
				GameTextForPlayer(ProjectEditor, Str_Small, 1000, 3);
	            EditDraw[CurrentID][Bg] = RGBAToHex(Color[0], Color[1], Color[2], Color[3]);
	            RecreateTextDraw();
	        }
	        case EDIT_MODE_BOXCOLOR:
	        {
	            HexToRGBA(EditDraw[CurrentID][Bc], Color[0], Color[1], Color[2], Color[3]);
	            switch(ColorMode)
	            {
	                case COLOR_MODE_RED: Color[0] = floatround(  floatdiv((Y - 1), (ScreenHeight - 2)) * 255.0  );
	                case COLOR_MODE_GREEN: Color[1] = floatround(  floatdiv((X - 1), (ScreenWidth - 2)) * 255.0  );
                    case COLOR_MODE_BLUE: Color[2] = floatround(  floatdiv((Y - 1), (ScreenHeight - 2)) * 255.0 );
                    case COLOR_MODE_ALPHA: Color[3] = floatround(  floatdiv((X - 1), (ScreenWidth - 2)) * 255.0  );
				}
				format(Str_Small, sizeof Str_Small, "~n~~r~R%i~n~~g~G%i~n~~b~B%i~n~~w~A%i", Color[0], Color[1], Color[2], Color[3]);
				GameTextForPlayer(ProjectEditor, Str_Small, 1000, 3);
	            EditDraw[CurrentID][Bc] = RGBAToHex(Color[0], Color[1], Color[2], Color[3]);
	            RecreateTextDraw();
	        }
	        case EDIT_MODE_CREATE_UBOX:
			{
			    EditDraw[CurrentID][cX] = (floatdiv(X, ScreenWidth) * 640.0) + 2.0;
			    EditDraw[CurrentID][lY] = ((floatdiv(Y, ScreenHeight) * 448.0) - EditDraw[CurrentID][cY])/9.0;
			    EditDraw[CurrentID][lY] -= 0.15;
			    RecreateTextDraw();
			}

			case EDIT_MODE_POSITION:
			{
			    if(EditDraw[CurrentID][Ub] && EditDraw[CurrentID][lX] == 0.0)
			    {
			        EditDraw[CurrentID][cX] -= floatdiv(floatsub(MouseOldX, X), ScreenWidth) * 640.0 * EditSpeed;
				    EditDraw[CurrentID][tX] -= floatdiv(floatsub(MouseOldX, X), ScreenWidth) * 640.0 * EditSpeed;
		    		EditDraw[CurrentID][cY] -= floatdiv(floatsub(MouseOldY, Y), ScreenHeight) * 448.0 * EditSpeed;
		    		format(stringll, 48, "X - %f~n~Y - %f",EditDraw[CurrentID][cX],EditDraw[CurrentID][cY]);
		    		TextDrawSetString(TD_Coord, stringll);
			    } else {
			        EditDraw[CurrentID][cX] -= floatdiv(floatsub(MouseOldX, X), ScreenWidth) * 640.0 * EditSpeed;
			    	EditDraw[CurrentID][cY] -= floatdiv(floatsub(MouseOldY, Y), ScreenHeight) * 448.0 * EditSpeed;
			    	format(stringll, 48, "X - %f~n~Y - %f",EditDraw[CurrentID][cX],EditDraw[CurrentID][cY]);
		    		TextDrawSetString(TD_Coord, stringll);
			    }
			    RecreateTextDraw();
			}
			case EDIT_MODE_SIZE:
			{
                if(EditDraw[CurrentID][Ub] && EditDraw[CurrentID][lX] == 0.0)
			    {
			        EditDraw[CurrentID][lY] -= (floatdiv(floatsub(MouseOldY, Y), ScreenWidth) * 640.0)/10.0 * EditSpeed;
				    EditDraw[CurrentID][cX] -= floatdiv(floatsub(MouseOldX, X), ScreenWidth) * 640.0 * EditSpeed;
				    format(stringll, 48, "size X - %f~n~size Y - %f",EditDraw[CurrentID][cX],EditDraw[CurrentID][lY]);
		    		TextDrawSetString(TD_Coord, stringll);
			    } else {
				    EditDraw[CurrentID][tX] -= floatdiv(floatsub(MouseOldX, X), ScreenWidth) * 640.0 * EditSpeed;
				    EditDraw[CurrentID][tY] -= floatdiv(floatsub(MouseOldY, Y), ScreenHeight) * 448.0 * EditSpeed;
				    format(stringll, 48, "size X - %f~n~size Y - %f",EditDraw[CurrentID][tX],EditDraw[CurrentID][tY]);
		    		TextDrawSetString(TD_Coord, stringll);
			    }
			    RecreateTextDraw();
			}
			case EDIT_MODE_LETTERSIZE:
			{
			    EditDraw[CurrentID][lX] -= floatdiv(floatsub(MouseOldX, X), ScreenWidth) * 640.0 * EditSpeed * 0.001;
			    EditDraw[CurrentID][lY] -= floatdiv(floatsub(MouseOldY, Y), ScreenHeight) * 448.0 * EditSpeed * 0.01;
			    format(stringll, 48, "size X - %f~n~size Y - %f",EditDraw[CurrentID][lX],EditDraw[CurrentID][lY]);
	    		TextDrawSetString(TD_Coord, stringll);
			    RecreateTextDraw();
			}
			case EDIT_MODE_OUTLINE:
			{
			    EditDraw[CurrentID][Ol] -= floatround(floatdiv(floatsub(MouseOldX, X), ScreenWidth) * 640.0);
			    EditDraw[CurrentID][Ol] -= floatround(floatdiv(floatsub(MouseOldY, Y), ScreenHeight) * 448.0);
			    RecreateTextDraw();
			}
			case EDIT_MODE_SHADOW:
			{
			    EditDraw[CurrentID][Sd] -= floatround(floatdiv(floatsub(MouseOldX, X), ScreenWidth) * 640.0);
			    EditDraw[CurrentID][Sd] -= floatround(floatdiv(floatsub(MouseOldY, Y), ScreenHeight) * 448.0);
			    RecreateTextDraw();
			}
			case EDIT_MODE_CREATE_TBOX:
			{
			    EditDraw[CurrentID][tX] = (floatdiv((X == ScreenWidth - 1) ? ScreenWidth : X, ScreenWidth) * 640.0) - EditDraw[CurrentID][cX];
	    		EditDraw[CurrentID][tY] = (floatdiv((Y == ScreenHeight - 1) ? ScreenHeight : Y, ScreenHeight) * 448.0) - EditDraw[CurrentID][cY];
				RecreateTextDraw();
			}
	    }
	}
	return true;
}

new PreviewText[128];
stock ReplaceSpaces(string[], size = sizeof string)
	for(new i=0; i < size; i++) if(string[i] == ' ') string[i] = '_';

stock RecreateTextDraw(bool:show = true)
{
	if(CurrentID == -1) return true;
    TextDrawDestroy(EditDraw[CurrentID][Id]);
    
	format(PreviewText, sizeof PreviewText, "%s", EditDraw[CurrentID][TSTR]);
	ReplaceSpaces(PreviewText);
	
	EditDraw[CurrentID][Id] = TextDrawCreate(EditDraw[CurrentID][cX], EditDraw[CurrentID][cY], PreviewText);
	TextDrawLetterSize(EditDraw[CurrentID][Id], EditDraw[CurrentID][lX], EditDraw[CurrentID][lY]);
	TextDrawTextSize(EditDraw[CurrentID][Id], EditDraw[CurrentID][tX],EditDraw[CurrentID][tY]);
	TextDrawAlignment(EditDraw[CurrentID][Id], EditDraw[CurrentID][Al]);
	TextDrawColor(EditDraw[CurrentID][Id],EditDraw[CurrentID][Cl]);
	TextDrawUseBox(EditDraw[CurrentID][Id],EditDraw[CurrentID][Ub]);
	TextDrawBoxColor(EditDraw[CurrentID][Id],EditDraw[CurrentID][Bc]);
	TextDrawSetShadow(EditDraw[CurrentID][Id],EditDraw[CurrentID][Sd]);
	TextDrawSetOutline(EditDraw[CurrentID][Id],EditDraw[CurrentID][Ol]);
	TextDrawBackgroundColor(EditDraw[CurrentID][Id],EditDraw[CurrentID][Bg]);
	TextDrawFont(EditDraw[CurrentID][Id],EditDraw[CurrentID][Ft]);
	TextDrawSetProportional(EditDraw[CurrentID][Id],EditDraw[CurrentID][Pr]);
	TextDrawSetSelectable(EditDraw[CurrentID][Id],EditDraw[CurrentID][Sl]);
	if(show) TextDrawShowForPlayer(ProjectEditor, EditDraw[CurrentID][Id]);
	return true;
}

stock ListTexdraws(playerid)
{
    SaveProject(ProjectName);
    
	Str_Large = "\0";
	
	if(CurrentID == -1) format(Str_Small, sizeof Str_Small, "(No textdraw selected)");
	else format(Str_Small, sizeof Str_Small, "(%i)%s", CurrentID, EditDraw[CurrentID][TSTR]);
	
	format(Str_Large, sizeof Str_Large, "{00BFFF}Current: %s\n{00DE04}Create New..\n{DE0000}Destroy Current..", Str_Small);
	
	for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++)
	{
	    if(EditDraw[i][Id] == Text:INVALID_TEXT_DRAW) continue;
        if(CurrentID == i) format(Str_Small, sizeof Str_Small, "\n{00BFFF}(%i)%s", i, EditDraw[i][TSTR]);
        else format(Str_Small, sizeof Str_Small, "\n(%i)%s", i, EditDraw[i][TSTR]);
        strcat(Str_Large, Str_Small);
	}
	ShowPlayerDialogX(playerid, DIALOG_MANAGE, DIALOG_STYLE_LIST, "Manage Textdraws", Str_Large, "Current Edit", "Close");
}

stock ListCheck(projectname[])
{
    new buffer[128], File:IO = fopen(PROJECT_LIST);
	while(fread(IO, buffer))
	{
	    if(!strcmp(buffer, projectname, true, strlen(projectname)))
	    {
		    return true;
	    }
	}
	fclose(IO);
	return false;
}

stock AddProject(projectname[])
{
    new File:IO = fopen(PROJECT_LIST, io_append);
    fwrite(IO, projectname);
    fwrite(IO, "\r\n");
    fclose(IO);
}

stock RemoveProject(projectname[])
{
    iS = "\0";
    new buffer[128], File:IO = fopen(PROJECT_LIST);
	while(fread(IO, buffer))
	{
	    if(strcmp(buffer, projectname, true, strlen(projectname)))
	    {
		    format(buffer, sizeof buffer, "%s", buffer);
		    strcat(iS, buffer);
	    }
	}
	fclose(IO);
	fremove(PROJECT_LIST);
	IO = fopen(PROJECT_LIST, io_write);
	fwrite(IO, iS);
	fclose(IO);
}

stock GetProjectList()
{
	Str_Large = "\0";
	if(!fexist(PROJECT_LIST)) return Str_Large;
	
	new File:IO = fopen(PROJECT_LIST, io_read);
	while(fread(IO, Str_Normal))
	{
	    format(Str_Normal, sizeof Str_Normal, "%s", Str_Normal);
	    strcat(Str_Large, Str_Normal);
	}
	fclose(IO);
	
	if(isnull(Str_Large)) Str_Large = "(No projects created yet)";
	return Str_Large;
}

stock CloseProject()
{
    for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++) RemoveTextDraw(i);
    ProjectName = "";

    ProjectSaved = true;
    TextDrawColor(TD_Menu[3], 0x888888FF);
	TextDrawSetSelectable(TD_Menu[3], false);
	TextDrawColor(TD_Menu[4], 0x888888FF);
	TextDrawSetSelectable(TD_Menu[4], false);
	TextDrawColor(TD_Menu[8], 0x888888FF);
	TextDrawSetSelectable(TD_Menu[8], false);
	
	if(IsPlayerConnected(ProjectEditor))
	{
	    TextDrawShowForPlayer(ProjectEditor, TD_Menu[3]);
		TextDrawShowForPlayer(ProjectEditor, TD_Menu[4]);
		TextDrawShowForPlayer(ProjectEditor, TD_Menu[8]);
	}
	
	if(IsPlayerConnected(ProjectEditor)) ShowDrawMenu(ProjectEditor);
    return true;
}

/** BY DRACOBLUE
 *  Strips Newline from the end of a string.
 *  Idea: Y_Less, Bugfixing (when length=1) by DracoBlue
 *  @param   string
 */
stock StripNewLine(string[])
{
	new len = strlen(string);
	if (string[0]==0) return ;
	if ((string[len - 1] == '\n') || (string[len - 1] == '\r')) {
		string[len - 1] = 0;
		if (string[0]==0) return ;
		if ((string[len - 2] == '\n') || (string[len - 2] == '\r')) string[len - 2] = 0;
	}
}

stock LoadProject(projectname[])
{
	for(new i=0; i < sizeof Undo; i++) Undo[i] = "\0";
	
	if(!fexist(projectname))
	{
	    if(ProjectEditor != -1)
	    {
			format(Str_Normal, sizeof Str_Normal, "Error: Project File not found: %s", projectname);
			SendClientMessage(ProjectEditor, 0xFF0000FF, Str_Normal);
		}
		return true;
	}
	
	new Index, File:IO = fopen(projectname, io_read);
	if(!IO) return false;

	while(fread(IO, Str_TextdrawData))
	{
	    StripNewLine(Str_TextdrawData);
		if(!sscanf(Str_TextdrawData, "p<|>ffffffiiiiiiiiiiis[128]",
		EditDraw[Index][cX],EditDraw[Index][cY],
		EditDraw[Index][lX],EditDraw[Index][lY],
		EditDraw[Index][tX],EditDraw[Index][tY],
		EditDraw[Index][Al],EditDraw[Index][Cl],
		EditDraw[Index][Ub],EditDraw[Index][Bc],
		EditDraw[Index][Sd],EditDraw[Index][Ol],
		EditDraw[Index][Bg],EditDraw[Index][Ft],
		EditDraw[Index][Pr],EditDraw[Index][Sl],
		EditDraw[Index][tType],EditDraw[Index][TSTR])) {
		    CurrentID = Index;
		    RecreateTextDraw(false);
			Index++;
		}
	}
	CurrentID = -1;
	fclose(IO);
	
	ProjectSaved = false;
	TextDrawColor(TD_Menu[3], 0xDDDDDDFF);
	TextDrawSetSelectable(TD_Menu[3], true);
	TextDrawColor(TD_Menu[4], 0xDDDDDDFF);
	TextDrawSetSelectable(TD_Menu[4], true);
	TextDrawColor(TD_Menu[8], 0xDDDDDDFF);
	TextDrawSetSelectable(TD_Menu[8], true);
	
	if(IsPlayerConnected(ProjectEditor))
	{
		TextDrawShowForPlayer(ProjectEditor, TD_Menu[3]);
		TextDrawShowForPlayer(ProjectEditor, TD_Menu[4]);
		TextDrawShowForPlayer(ProjectEditor, TD_Menu[8]);
	}
	
	format(Str_Normal, sizeof Str_Normal, "Project: {00FF00}'%s'{FFFFFF} loaded!", projectname);
	SendClientMessage(ProjectEditor, -1, Str_Normal);
	return true;
}

stock SaveProject(projectname[])
{
	if(!strlen(ProjectName)) return false;
	if(fexist(projectname)) if(!fremove(projectname)) return false;
	
	new File:IO = fopen(projectname, io_append);
	if(!IO) return false;
	
	for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++)
	{
	    if(EditDraw[i][Id] == Text:INVALID_TEXT_DRAW) continue;
	    format(Str_TextdrawData, sizeof Str_TextdrawData,
		"%.3f|%.3f|%.3f|%.3f|%.3f|%.3f|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%s\r\n",
	    EditDraw[i][cX],EditDraw[i][cY],
		EditDraw[i][lX],EditDraw[i][lY],
		EditDraw[i][tX],EditDraw[i][tY],
		EditDraw[i][Al],EditDraw[i][Cl],
		EditDraw[i][Ub],EditDraw[i][Bc],
		EditDraw[i][Sd],EditDraw[i][Ol],
		EditDraw[i][Bg],EditDraw[i][Ft],
		EditDraw[i][Pr],EditDraw[i][Sl],
		EditDraw[i][tType],EditDraw[i][TSTR]);
		fwrite(IO, Str_TextdrawData);
	}
	fclose(IO);
	return true;
}

stock ExportProject()
{
    if(!strlen(ProjectName)) return false;
    
    new Output[64];
	format(Output, sizeof Output, "%s", ProjectName);

	strins(Output, "TD_", 0);
	new len = strlen(Output);
	strdel(Output, len - 3, len);
	strcat(Output, "pwn");
    
    if(fexist(Output))
    {
        format(Str_Normal, sizeof Str_Normal, "Export: Overwriting '%s'..", Output);
        SendClientMessage(ProjectEditor, -1, Str_Normal);
        fremove(Output);
    }
    
    new File:IO = fopen(Output, io_append);
    
    fwrite(IO, "// These textdraws has been generated using iPLEOMAX's TextDraw Editor.\r\n// Thank you for using this tool!\r\n\r\n");
    
    new bool:GLTD;
    for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++)
    {
        if(EditDraw[i][Id] == Text:INVALID_TEXT_DRAW) continue;
        if(EditDraw[i][tType]) continue;
        if(!GLTD)
        {
            fwrite(IO, "//Global Textdraws:\r\n");
            GLTD = true;
        }
        
        format(Str_Normal, sizeof Str_Normal, "new Text:Textdraw%i = Text:INVALID_TEXT_DRAW;\r\n", i);
        fwrite(IO, Str_Normal);
    }
    
    if(GLTD)
    {
	    fwrite(IO, "\r\npublic OnFilterScriptInit() //or OnGameModeInit()\r\n{");

	    for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++)
	    {
	        if(EditDraw[i][Id] == Text:INVALID_TEXT_DRAW) continue;
	        if(EditDraw[i][tType]) continue;

			format(Str_TextdrawData, sizeof Str_TextdrawData, "\r\n\tTextdraw%i = TextDrawCreate(%.3f, %.3f, \"%s\");\r\n",
			i, EditDraw[i][cX], EditDraw[i][cY], EditDraw[i][TSTR]);
			fwrite(IO, Str_TextdrawData);

			if((EditDraw[i][lX] + EditDraw[i][lY]))
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawLetterSize(Textdraw%i, %.3f, %.3f);\r\n",
				i, EditDraw[i][lX], EditDraw[i][lY]);
				fwrite(IO, Str_TextdrawData);
			}

			if((EditDraw[i][tX] + EditDraw[i][tY]))
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawTextSize(Textdraw%i, %.3f, %.3f);\r\n",
				i, EditDraw[i][tX], EditDraw[i][tY]);
				fwrite(IO, Str_TextdrawData);
			}

			format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawAlignment(Textdraw%i, %i);\r\n", i, EditDraw[i][Al]);
			fwrite(IO, Str_TextdrawData);

			format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawColor(Textdraw%i, %i);\r\n", i, EditDraw[i][Cl]);
			fwrite(IO, Str_TextdrawData);

			if(EditDraw[i][Ub])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawUseBox(Textdraw%i, 1);\r\n", i);
				fwrite(IO, Str_TextdrawData);

				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawBoxColor(Textdraw%i, %i);\r\n", i, EditDraw[i][Bc]);
				fwrite(IO, Str_TextdrawData);
			}

			if(EditDraw[i][Sd])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawSetShadow(Textdraw%i, %i);\r\n", i, EditDraw[i][Sd]);
				fwrite(IO, Str_TextdrawData);
			}

			if(EditDraw[i][Ol])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawSetOutline(Textdraw%i, %i);\r\n", i, EditDraw[i][Ol]);
				fwrite(IO, Str_TextdrawData);
			}

			if(EditDraw[i][Bg])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawBackgroundColor(Textdraw%i, %i);\r\n", i, EditDraw[i][Bg]);
				fwrite(IO, Str_TextdrawData);
			}

			format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawFont(Textdraw%i, %i);\r\n", i, EditDraw[i][Ft]);
			fwrite(IO, Str_TextdrawData);

			if(EditDraw[i][Pr])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawSetProportional(Textdraw%i, %i);\r\n", i, EditDraw[i][Pr]);
				fwrite(IO, Str_TextdrawData);
			}

			if(EditDraw[i][Sl])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tTextDrawSetSelectable(Textdraw%i, true);\r\n", i);
				fwrite(IO, Str_TextdrawData);
			}
	    }
	    fwrite(IO, "\r\n\treturn 1;\r\n}\r\n\r\npublic OnFilterScriptExit() //or OnGameModeExit\r\n{");
	    
	    for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++)
	    {
	        if(EditDraw[i][Id] == Text:INVALID_TEXT_DRAW) continue;
	        if(EditDraw[i][tType]) continue;
	        
	        format(Str_TextdrawData, sizeof Str_TextdrawData, "\r\n\tTextDrawDestroy(Textdraw%i);\r\n\tTextdraw%i = Text:INVALID_TEXT_DRAW;\r\n", i, i);
            fwrite(IO, Str_TextdrawData);
		}
	}
	
	fwrite(IO, "\r\n\treturn 1;\r\n}\r\n\r\n////////////////////////////////////////////////////////////////////////////////\r\n\r\n");

    new bool:PLTD;
    for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++)
    {
        if(EditDraw[i][Id] == Text:INVALID_TEXT_DRAW) continue;
        if(!EditDraw[i][tType]) continue;
		if(!PLTD)
		{
		    fwrite(IO, "//Player Textdraws:\r\n");
			PLTD = true;
		}
		
        format(Str_Normal, sizeof Str_Normal, "new PlayerText:Textdraw%i[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};\r\n", i);
        fwrite(IO, Str_Normal);
    }

	if(PLTD)
	{
	    fwrite(IO, "\r\npublic OnPlayerConnect(playerid)\r\n{");

	    for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++)
	    {
	        if(EditDraw[i][Id] == Text:INVALID_TEXT_DRAW) continue;
	        if(!EditDraw[i][tType]) continue;

	        format(Str_TextdrawData, sizeof Str_TextdrawData, "\r\n\tTextdraw%i[playerid] = CreatePlayerTextDraw(playerid, %.3f, %.3f, \"%s\");\r\n",
			i, EditDraw[i][cX], EditDraw[i][cY], EditDraw[i][TSTR]);
			fwrite(IO, Str_TextdrawData);

			if((EditDraw[i][lX] + EditDraw[i][lY]))
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawLetterSize(playerid, Textdraw%i[playerid], %.3f, %.3f);\r\n",
				i, EditDraw[i][lX], EditDraw[i][lY]);
				fwrite(IO, Str_TextdrawData);
			}

			if((EditDraw[i][tX] + EditDraw[i][tY]))
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawTextSize(playerid, Textdraw%i[playerid], %.3f, %.3f);\r\n",
				i, EditDraw[i][tX], EditDraw[i][tY]);
				fwrite(IO, Str_TextdrawData);
			}

			format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawAlignment(playerid, Textdraw%i[playerid], %i);\r\n", i, EditDraw[i][Al]);
			fwrite(IO, Str_TextdrawData);

			format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawColor(playerid, Textdraw%i[playerid], %i);\r\n", i, EditDraw[i][Cl]);
			fwrite(IO, Str_TextdrawData);

			if(EditDraw[i][Ub])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawUseBox(playerid, Textdraw%i[playerid], 1);\r\n", i);
				fwrite(IO, Str_TextdrawData);

				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawBoxColor(playerid, Textdraw%i[playerid], %i);\r\n", i, EditDraw[i][Bc]);
				fwrite(IO, Str_TextdrawData);
			}

			if(EditDraw[i][Sd])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawSetShadow(playerid, Textdraw%i[playerid], %i);\r\n", i, EditDraw[i][Sd]);
				fwrite(IO, Str_TextdrawData);
			}

			if(EditDraw[i][Ol])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawSetOutline(playerid, Textdraw%i[playerid], %i);\r\n", i, EditDraw[i][Ol]);
				fwrite(IO, Str_TextdrawData);
			}

			if(EditDraw[i][Bg])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawBackgroundColor(playerid, Textdraw%i[playerid], %i);\r\n", i, EditDraw[i][Bg]);
				fwrite(IO, Str_TextdrawData);
			}

			format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawFont(playerid, Textdraw%i[playerid], %i);\r\n", i, EditDraw[i][Ft]);
			fwrite(IO, Str_TextdrawData);

			if(EditDraw[i][Pr])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawSetProportional(playerid, Textdraw%i[playerid], %i);\r\n", i, EditDraw[i][Pr]);
				fwrite(IO, Str_TextdrawData);
			}

			if(EditDraw[i][Sl])
			{
				format(Str_TextdrawData, sizeof Str_TextdrawData, "\tPlayerTextDrawSetSelectable(playerid, Textdraw%i[playerid], true);\r\n", i);
				fwrite(IO, Str_TextdrawData);
			}
	    }

	    fwrite(IO, "\r\n\treturn 1;\r\n}\r\n\r\npublic OnPlayerDisconnect(playerid, reason)\r\n{");
	    for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++)
	    {
	        if(EditDraw[i][Id] == Text:INVALID_TEXT_DRAW) continue;
	        if(!EditDraw[i][tType]) continue;

	        format(Str_TextdrawData, sizeof Str_TextdrawData,
			"\r\n\tPlayerTextDrawDestroy(playerid, Textdraw%i[playerid]);\r\n\tTextdraw%i[playerid] = PlayerText:INVALID_TEXT_DRAW;\r\n",i,i);
	        fwrite(IO, Str_TextdrawData);
		}

	    fwrite(IO, "\r\n\treturn 1;\r\n}");
    }
    
	fclose(IO);
	
	format(Str_Normal, sizeof Str_Normal, "Project: Textdraw data exported to: {00FF00}'%s'", Output);
	SendClientMessage(ProjectEditor, -1, Str_Normal);
	
	return true;
}

public OnFilterScriptInit()
{
	if(!fexist("/projects.lst")) {
		new File:IO = fopen("/projects.lst", io_write);
		fclose(IO);
	}

    SetTimer("VirtualKeyUpdate", 25, true);
	InitDrawMenu();
	return true;
}

public OnFilterScriptExit()
{
    for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++)
	{
	    if(EditDraw[i][Id] != Text:INVALID_TEXT_DRAW)
	    {
			TextDrawDestroy(EditDraw[i][Id]);
	    }
	}
	DestroyDrawMenu();
	return true;
}

CMD:itd(playerid, params[])
{
	new IP[16]; GetPlayerIp(playerid, IP, sizeof IP);
	if(strcmp(IP, "127.0.0.1"))
	return SendClientMessage(playerid, 0xFF0000FF, "Only the host can manage textdraws. (Your IP is remote)");
	
	if(ProjectEditor != -1 && ProjectEditor != playerid)
	return SendClientMessage(playerid, 0xFF0000FF, "Only one person can manage textdraws at a time.");

	ShowDrawMenu(playerid);
	return true;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == Text:INVALID_TEXT_DRAW)
	{
	    if(TempHide) ShowDrawMenu(playerid);
	    else if(MenuShown) HideDrawMenu(playerid);
	}
	
	if(Dialog || (gettime() - DialogResponse < 1)) return true;
	
    if(clickedid == TD_Menu[1])
	{
	    if(!ProjectSaved) SaveProject(ProjectName);
	    ShowPlayerDialogX(playerid, DIALOG_NEW, DIALOG_STYLE_INPUT, "New Project", "Enter the name of you new project here:\n\n",
	    "Create", "Back");
	}
	if(clickedid == TD_Menu[2])
	{
	    if(!ProjectSaved) SaveProject(ProjectName);
	    ShowPlayerDialogX(playerid, DIALOG_OPEN, DIALOG_STYLE_LIST, "Open Project", GetProjectList(), "Open", "Cancel");
	}
	if(clickedid == TD_Menu[3])
	{
	    if(!strlen(ProjectName)) return SendClientMessage(playerid, -1, "Project: You aren't editing any project");
     	if(!ProjectSaved) { SaveProject(ProjectName); ProjectSaved = true; }
	     
	    format(Str_Normal, sizeof Str_Normal, "Project: {00FF00}%s{FFFFFF} has been saved and closed.", ProjectName);
	    SendClientMessage(playerid, -1, Str_Normal);
	    CloseProject();
	}
	if(clickedid == TD_Menu[4])
	{
	    ExportProject();
	}
	
	if(clickedid == TD_Menu[8]) ListTexdraws(playerid);//TempHideMenu(playerid), ListTexdraws(playerid);
	
	if(CurrentID != -1)
	{
	    if(clickedid == TD_Menu[9])
		{
			EditMode = EDIT_MODE_POSITION;
			TempHideMenu(playerid);
			SendClientMessage(playerid, -1, "Modify {00FF00}Position{FFFFFF}: Press LMB and move cursor to adjust.");
		}
		
		if(clickedid == TD_Menu[10])
		{
			EditMode = EDIT_MODE_SIZE;
			TempHideMenu(playerid);
			SendClientMessage(playerid, -1, "Modify {00FF00}Size{FFFFFF}: Press LMB and move cursor to adjust.");
		}
		
		if(clickedid == TD_Menu[11])
		{
			format(Str_Normal, sizeof Str_Normal, "Current text:\n%s\n\n", EditDraw[CurrentID][TSTR]);
		    ShowPlayerDialogX(playerid, DIALOG_EDITTEXT, DIALOG_STYLE_INPUT, "Change Text", Str_Normal, "Done", "Back");
		    EditMode = EDIT_MODE_TEXT;
		}
		
		if(clickedid == TD_Menu[16])
		{
			EditMode = EDIT_MODE_LETTERSIZE;
			TempHideMenu(playerid);
			SendClientMessage(playerid, -1, "Modify {00FF00}LetterSize{FFFFFF}: Press LMB and drag to adjust.");
		}
		
		if(clickedid == TD_Menu[14])
		{
		    EditMode = EDIT_MODE_COLOR;
		    TempHideMenu(playerid);
		    SendClientMessage(playerid, -1, "Modify {00FF00}Color{FFFFFF}: Red: Mouse click drag on the Left side of your screen. Green: Top. Blue: Right. Alpha: Bottom");
		}
		

		if(clickedid == TD_Menu[15])
		{
	 		EditMode = EDIT_MODE_BGCOLOR;
	 		SendClientMessage(playerid, -1, "Modify {00FF00}Outline/Shadow Color{FFFFFF}: Red: Mouse click drag on the Left side of your screen. Green: Top. Blue: Right. Alpha: Bottom");
	 		TempHideMenu(playerid);
		}
		
		if(clickedid == TD_Menu[32])
		{
		    if(!EditDraw[CurrentID][Ub]) return SendClientMessage(playerid, -1, "Info: Box must be enabled before using Box Color Tool");
	 		EditMode = EDIT_MODE_BOXCOLOR;
	 		SendClientMessage(playerid, -1, "Modify {00FF00}Box Color{FFFFFF}: Red: Mouse click drag on the Left side of your screen. Green: Top. Blue: Right. Alpha: Bottom");
	 		TempHideMenu(playerid);
		}
		
		if(clickedid == TD_Menu[17])
		{
			EditMode = EDIT_MODE_OUTLINE, TempHideMenu(playerid), EditDraw[CurrentID][Sd] = 0;
			SendClientMessage(playerid, -1, "Modify {00FF00}Outline{FFFFFF}: Press LMB and drag to adjust or RMB to disable outline.");
			if(!EditDraw[CurrentID][Bg]) EditDraw[CurrentID][Bg] = 0x00000066;
		}
		
		if(clickedid == TD_Menu[18])
		{
			EditMode = EDIT_MODE_SHADOW, TempHideMenu(playerid), EditDraw[CurrentID][Ol] = 0;
			SendClientMessage(playerid, -1, "Modify {00FF00}Shadow{FFFFFF}: Press LMB and drag to adjust or RMB to disable shadow.");
			if(!EditDraw[CurrentID][Bg]) EditDraw[CurrentID][Bg] = 0x00000066;
		}
		
		if(clickedid == TD_Menu[31] || clickedid == TD_Menu[30])
		{
		    SaveUndo(CurrentID);
			switch(EditDraw[CurrentID][Pr])
			{
			    case 0:
			    {
			        if(!TempHide)
			        {
			            TextDrawHideForPlayer(playerid, TD_Menu[30]);
			            TextDrawShowForPlayer(playerid, TD_Menu[31]);
			        }
			        EditDraw[CurrentID][Pr] = 1;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Proportionality ON.", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			    case 1:
			    {
			        if(!TempHide)
			        {
			            TextDrawHideForPlayer(playerid, TD_Menu[31]);
			            TextDrawShowForPlayer(playerid, TD_Menu[30]);
			        }
			        EditDraw[CurrentID][Pr] = 0;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Proportionality OFF.", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			}
			RecreateTextDraw(TempHide ? true : false);
		}
		if(clickedid == TD_Menu[29] || clickedid == TD_Menu[28])
		{
		    SaveUndo(CurrentID);
			switch(EditDraw[CurrentID][Sl])
			{
			    case 0:
			    {
			        if(!TempHide)
			        {
						TextDrawHideForPlayer(playerid, TD_Menu[28]);
						TextDrawShowForPlayer(playerid, TD_Menu[29]);
					}
			        EditDraw[CurrentID][Sl] = 1;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Selectability ON.", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			    case 1:
			    {
			        if(!TempHide)
			        {
				        TextDrawHideForPlayer(playerid, TD_Menu[29]);
						TextDrawShowForPlayer(playerid, TD_Menu[28]);
			        }
			        EditDraw[CurrentID][Sl] = 0;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Selectability OFF.", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			}
			RecreateTextDraw(TempHide ? true : false);
		}
		if(clickedid == TD_Menu[27] || clickedid == TD_Menu[26]|| clickedid == TD_Menu[25]|| clickedid == TD_Menu[24] || clickedid == TD_Menu[12])
		{
		    SaveUndo(CurrentID);
			switch(EditDraw[CurrentID][Ft])
			{
			    case 3:
			    {
			        if(!TempHide)
			        {
				        TextDrawHideForPlayer(playerid, TD_Menu[24]);
						TextDrawHideForPlayer(playerid, TD_Menu[25]);
				        TextDrawHideForPlayer(playerid, TD_Menu[26]);
				        TextDrawHideForPlayer(playerid, TD_Menu[27]);
						TextDrawShowForPlayer(playerid, TD_Menu[12]);
			        }
			        EditDraw[CurrentID][Ft] = 4;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Font type set to 4 (Texture).", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			    case 0:
			    {
			        if(!TempHide)
			        {
				        TextDrawHideForPlayer(playerid, TD_Menu[24]);
				        TextDrawHideForPlayer(playerid, TD_Menu[26]);
				        TextDrawHideForPlayer(playerid, TD_Menu[27]);
				        TextDrawHideForPlayer(playerid, TD_Menu[12]);
				        TextDrawShowForPlayer(playerid, TD_Menu[25]);
			        }
			        EditDraw[CurrentID][Ft] = 1;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Font type set to 1.", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			    case 1:
			    {
			        if(!TempHide)
			        {
				        TextDrawHideForPlayer(playerid, TD_Menu[24]);
				        TextDrawHideForPlayer(playerid, TD_Menu[25]);
				        TextDrawHideForPlayer(playerid, TD_Menu[27]);
				        TextDrawHideForPlayer(playerid, TD_Menu[12]);
				        TextDrawShowForPlayer(playerid, TD_Menu[26]);
			        }
			        EditDraw[CurrentID][Ft] = 2;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Font type set to 2.", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			    case 2:
			    {
			        if(!TempHide)
			        {
				        TextDrawHideForPlayer(playerid, TD_Menu[24]);
				        TextDrawHideForPlayer(playerid, TD_Menu[25]);
				        TextDrawHideForPlayer(playerid, TD_Menu[26]);
				        TextDrawHideForPlayer(playerid, TD_Menu[12]);
				        TextDrawShowForPlayer(playerid, TD_Menu[27]);
			        }
			        EditDraw[CurrentID][Ft] = 3;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Font type set to 3.", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			    case 4:
			    {
			        if(!TempHide)
			        {
				        TextDrawHideForPlayer(playerid, TD_Menu[25]);
				        TextDrawHideForPlayer(playerid, TD_Menu[26]);
				        TextDrawHideForPlayer(playerid, TD_Menu[27]);
				        TextDrawHideForPlayer(playerid, TD_Menu[12]);
						TextDrawShowForPlayer(playerid, TD_Menu[24]);
			        }
			        EditDraw[CurrentID][Ft] = 0;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Font type set to 0.", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			}
			RecreateTextDraw(TempHide ? true : false);
		}
		
		if(clickedid == TD_Menu[23] || clickedid == TD_Menu[22] || clickedid == TD_Menu[21])
		{
		    SaveUndo(CurrentID);
		    if(!EditDraw[CurrentID][Al]) EditDraw[CurrentID][Al] = 1;
			switch(EditDraw[CurrentID][Al])
			{
			    case 3:
			    {
			        if(!TempHide)
			        {
						TextDrawHideForPlayer(playerid, TD_Menu[22]);
						TextDrawHideForPlayer(playerid, TD_Menu[23]);
						TextDrawShowForPlayer(playerid, TD_Menu[21]);
					}
			        EditDraw[CurrentID][Al] = 1;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Alignment set to Left.", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			    case 1:
			    {
			        if(!TempHide)
			        {
				        TextDrawHideForPlayer(playerid, TD_Menu[21]);
				        TextDrawHideForPlayer(playerid, TD_Menu[23]);
						TextDrawShowForPlayer(playerid, TD_Menu[22]);
			        }
			        EditDraw[CurrentID][Al] = 2;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Alignment set to Centered.", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			    case 2:
			    {
			        if(!TempHide)
			        {
				        TextDrawHideForPlayer(playerid, TD_Menu[21]);
				        TextDrawHideForPlayer(playerid, TD_Menu[22]);
				        TextDrawShowForPlayer(playerid, TD_Menu[23]);
			        }
			        EditDraw[CurrentID][Al] = 3;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Alignment set to Right.", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			}
			RecreateTextDraw(TempHide ? true : false);
		} //20box,19boxno
		if(clickedid == TD_Menu[20] || clickedid == TD_Menu[19])
		{
		    SaveUndo(CurrentID);
			switch(EditDraw[CurrentID][Ub])
			{
			    case 1:
			    {
			        if(!TempHide)
			        {
						TextDrawHideForPlayer(playerid, TD_Menu[20]);
						TextDrawShowForPlayer(playerid, TD_Menu[19]);
					}
			        EditDraw[CurrentID][Ub] = 0;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Box OFF", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			    case 0:
			    {
			        if(!EditDraw[CurrentID][Bc]) EditDraw[CurrentID][Bc] = 0x00000066;
			        
			        if(!TempHide)
			        {
				        TextDrawHideForPlayer(playerid, TD_Menu[19]);
				        TextDrawShowForPlayer(playerid, TD_Menu[20]);
			        }
			        EditDraw[CurrentID][Ub] = 1;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Box ON", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			}
			RecreateTextDraw(TempHide ? true : false);
		}
		if(clickedid == TD_Menu[5] || clickedid == TD_Menu[33])
		{
		    SaveUndo(CurrentID);
			switch(EditDraw[CurrentID][tType])
			{
			    case 1:
			    {
			        if(!TempHide)
			        {
						TextDrawHideForPlayer(playerid, TD_Menu[33]);
						TextDrawShowForPlayer(playerid, TD_Menu[5]);
					}
			        EditDraw[CurrentID][tType] = 0;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Type set to Global TextDraw (Text)", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			    case 0:
			    {
			        if(!TempHide)
			        {
				        TextDrawHideForPlayer(playerid, TD_Menu[5]);
				        TextDrawShowForPlayer(playerid, TD_Menu[33]);
			        }
			        EditDraw[CurrentID][tType] = 1;
			        format(Str_Normal, sizeof Str_Normal, "Textdraw {00FF00}(%i){FFFFFF}: Type set to Player TextDraw (PlayerText:)", CurrentID);
	    			SendClientMessage(playerid, -1, Str_Normal);
			    }
			}
			RecreateTextDraw(TempHide ? true : false);
		}
	}
	
	return false;
}

stock ShowDrawMenu(playerid)
{
	//ShowPlayerDialog(playerid, -1, DIALOG_STYLE_MSGBOX, " ", " ", " ", " ");
	//Dialog = false;
	
	TogglePlayerControllable(playerid, false);
	
    ProjectEditor = playerid;
    
    for(new i = 0; i < MAX_LOADED_TEXTDRAWS; i++)
	    TextDrawHideForPlayer(ProjectEditor, EditDraw[i][Id]);

    TempHide = false;
	EditMode = 0;
	EditEnabled = false;

	if(0 <= CurrentID < MAX_LOADED_TEXTDRAWS)
	{
		for(new i = 0; i < sizeof TD_Menu; i++)
		{
		    TextDrawColor(TD_Menu[i], 0xDDDDDDFF);
		    TextDrawSetSelectable(TD_Menu[i], true);
		    
		    switch(i)
		    {
		        case 5, 33:
		        {
			        switch(EditDraw[CurrentID][tType])
					{
					    case 0: TextDrawShowForPlayer(playerid, TD_Menu[5]);
					    case 1: TextDrawShowForPlayer(playerid, TD_Menu[33]);
					}
				}
		        case 30, 31:
		        {
			        switch(EditDraw[CurrentID][Pr])
					{
					    case 0: TextDrawShowForPlayer(playerid, TD_Menu[30]);
					    case 1: TextDrawShowForPlayer(playerid, TD_Menu[31]);
					}
				}
				case 28, 29:
		        {
			        switch(EditDraw[CurrentID][Sl])
					{
					    case 0: TextDrawShowForPlayer(playerid, TD_Menu[28]);
					    case 1: TextDrawShowForPlayer(playerid, TD_Menu[29]);
					}
				}
				case 24, 25, 26, 27, 12:
		        {
			        switch(EditDraw[CurrentID][Ft])
					{
					    case 0: TextDrawShowForPlayer(playerid, TD_Menu[24]);
					    case 1: TextDrawShowForPlayer(playerid, TD_Menu[25]);
					    case 2: TextDrawShowForPlayer(playerid, TD_Menu[26]);
					    case 3: TextDrawShowForPlayer(playerid, TD_Menu[27]);
					    case 4: TextDrawShowForPlayer(playerid, TD_Menu[12]);
					}
				}
				case 21, 22, 23:
		        {
			        switch(EditDraw[CurrentID][Al])
					{
					    case 1: TextDrawShowForPlayer(playerid, TD_Menu[21]);
					    case 2: TextDrawShowForPlayer(playerid, TD_Menu[22]);
					    case 3: TextDrawShowForPlayer(playerid, TD_Menu[23]);
					}
				}
				case 19, 20:
		        {
			        switch(EditDraw[CurrentID][Ub])
					{
					    case 0: TextDrawShowForPlayer(playerid, TD_Menu[19]);
					    case 1: TextDrawShowForPlayer(playerid, TD_Menu[20]);
					}
				}
				case 0, 6, 7, 13:
				{
				    TextDrawColor(TD_Menu[i], 0xFFFFFFFF);
				    TextDrawSetSelectable(TD_Menu[i], false);
				    TextDrawShowForPlayer(playerid, TD_Menu[i]);
				}
				default: TextDrawShowForPlayer(playerid, TD_Menu[i]);
		    }
		}
	} else
	{
		for(new i = 0; i < sizeof TD_Menu; i++)
		{
			switch(i)
			{
			    case 5, 9..12, 14..33: { TextDrawColor(TD_Menu[i], 0x888888FF); TextDrawSetSelectable(TD_Menu[i], false); }
			}
			TextDrawShowForPlayer(playerid, TD_Menu[i]);
		}
	}
	
	SelectTextDraw(playerid, 0xFFFFFFFF);
	MenuShown = true;
}

stock RemoveTextDraw(index)
{
	if( !(0 <= index < MAX_LOADED_TEXTDRAWS) ) return false;
	
    TextDrawDestroy(EditDraw[index][Id]);
	EditDraw[index][Id] = Text:INVALID_TEXT_DRAW;
	EditDraw[index][cX] = 0.0, EditDraw[index][cY] = 0.0;
	EditDraw[index][lX] = 0.0, EditDraw[index][lY] = 0.0;
	EditDraw[index][tX] = 0.0, EditDraw[index][tY] = 0.0;
	EditDraw[index][Al] = 0, EditDraw[index][Cl] = 0;
	EditDraw[index][Ub] = 0, EditDraw[index][Bc] = 0;
	EditDraw[index][Sd] = 0, EditDraw[index][Ol] = 0;
	EditDraw[index][Bg] = 0, EditDraw[index][Ft] = 0;
	EditDraw[index][Pr] = 0, EditDraw[index][Sl] = 0;
	EditDraw[index][tType] = 0;
	format(EditDraw[index][TSTR], 128, "\0");
	
	if(CurrentID == index)
	{
		EditMode = 0;
		CurrentID = -1;
	}
	return true;
}

stock GetAvailableIndex()
{
	for(new i=0; i < MAX_LOADED_TEXTDRAWS; i++)
	{
	    if(EditDraw[i][Id] != Text:INVALID_TEXT_DRAW) continue;
	    return i;
	}
	return -1;
}

stock ValidProjectName(string[])
{
	for(new i = 0; i < strlen(string); i++)
	{
		switch(string[i])
		{
		    case 'A'..'Z': continue;
		    case 'a'..'z': continue;
		    case '0'..'9': continue;
		    case '(', ')', '.', '_', '\"', '!', '@', '-', '&', ',': continue;
		    default: return false;
		}
	}
	return true;
}

stock SaveUndo(Index, type = 0)
{
	for( new i = 0; i < MAX_UNDO - 1; i++ )
	Undo[i] = Undo[i+1];
	
	
	switch(type)
	{
	    case 0:
	    {
            format(Undo[MAX_UNDO - 1], sizeof Undo[],
			"%i|%.3f|%.3f|%.3f|%.3f|%.3f|%.3f|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%i|%s",
			Index,
		    EditDraw[Index][cX],EditDraw[Index][cY],
			EditDraw[Index][lX],EditDraw[Index][lY],
			EditDraw[Index][tX],EditDraw[Index][tY],
			EditDraw[Index][Al],EditDraw[Index][Cl],
			EditDraw[Index][Ub],EditDraw[Index][Bc],
			EditDraw[Index][Sd],EditDraw[Index][Ol],
			EditDraw[Index][Bg],EditDraw[Index][Ft],
			EditDraw[Index][Pr],EditDraw[Index][Sl],
			EditDraw[Index][tType],EditDraw[Index][TSTR]);
	    }
	    case 1:
	    {
	        format(Undo[MAX_UNDO - 1], sizeof Undo[], "%i %i", Index, CurrentID);
	    }
	}
}

stock ApplyUndo()
{
	new Count = 0, UIndex = -1;
	for( new i = 0; i < MAX_UNDO; i++ )
	{
	    if(!isnull(Undo[i])) UIndex = i, Count++;
	}
	if(UIndex == -1)
	{
	    SendClientMessage(ProjectEditor, -1, "Project: Can't undo anymore.");
	    return;
	}
	
	new index = -1, Float:ucX, Float:ucY, Float:ulX, Float:ulY, Float:utX, Float:utY,
	uAl, uCl, uUb, uBc, uSd, uOl, uBg, uFt, uPr, uSl, uT, uS[64];
	
	if(!sscanf(Undo[UIndex], "p<|>iffffffiiiiiiiiiiis[64]", index, ucX, ucY, ulX, ulY, utX, utY,
	uAl, uCl, uUb, uBc, uSd, uOl, uBg, uFt, uPr, uSl, uT, uS))
	{
	    if(index != -1)
	    {
	        EditDraw[index][cX] = ucX;
			EditDraw[index][cY] = ucY;
			EditDraw[index][lX] = ulX;
			EditDraw[index][lY] = ulY;
			EditDraw[index][tX] = utX;
			EditDraw[index][tY] = utY;
			EditDraw[index][Al] = uAl;
			EditDraw[index][Cl] = uCl;
			EditDraw[index][Ub] = uUb;
			EditDraw[index][Bc] = uBc;
			EditDraw[index][Sd] = uSd;
			EditDraw[index][Ol] = uOl;
			EditDraw[index][Bg] = uBg;
			EditDraw[index][Ft] = uFt;
			EditDraw[index][Pr] = uPr;
			EditDraw[index][Sl] = uSl;
			EditDraw[index][tType] = uT;
			format(EditDraw[index][TSTR], 128, "%s", uS);
			CurrentID = index;
			RecreateTextDraw();
	    }
	} else if(!sscanf(Undo[UIndex], "ii", index, CurrentID))
	{
		if(0 <= index < MAX_LOADED_TEXTDRAWS) RemoveTextDraw(index);
 }
	
	Undo[UIndex] = "\0";
	format(Str_Normal, sizeof Str_Normal, "Project: {00FF00}Undo{FFFFFF} applied (%i remaining)", Count-1);
	SendClientMessage(ProjectEditor, -1, Str_Normal);
	return;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(playerid != ProjectEditor) return false;
	
	Dialog = false;
    DialogResponse = gettime();
    
	switch(dialogid)
	{
	    case DIALOG_OPEN:
	    {
	        if(!response) return true;
			new index = -1, File:IO = fopen(PROJECT_LIST, io_read);
			while(fread(IO, Str_Normal))
			{
			    if(!isnull(Str_Normal))
			    {
			        index++;
			        if(listitem == index)
			        {
			            SaveProject(ProjectName);
			            CloseProject();
			            StripNewLine(Str_Normal);
						format(ProjectName, sizeof ProjectName, "\%s.iTD", Str_Normal);
						LoadProject(ProjectName);
						return true;
			        }
			    }
			}
	    }
	    case DIALOG_NEW:
	    {
	        if(!response) return true;
	        if(!strlen(inputtext)) { OnPlayerClickTextDraw(playerid, TD_Menu[1]); return true; }
	        if( !(1 <= strlen(inputtext) <= 32) )
	        {
	            SendClientMessage(playerid, 0xFF0000FF, "Please use a name within 1 to 32 characters.");
	            OnPlayerClickTextDraw(playerid, TD_Menu[1]);
				return true;
	        }
	        if(!ValidProjectName(inputtext))
			{
			    SendClientMessage(playerid, 0xFF0000FF, "Invalid Project name! Use valid characters: (A-B), (0-9), etc.");
				OnPlayerClickTextDraw(playerid, TD_Menu[1]);
				return true;
			}
			
			for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++) RemoveTextDraw(i);
			
	        format(ProjectName, sizeof ProjectName, "/%s.iTD", inputtext);
	        if(fexist(ProjectName))
			{
			    format(Str_Normal, sizeof Str_Normal, "Project: {00FF00}%s.iTD{FFFFFF} already exists, re-opened.", inputtext);
			    SendClientMessage(playerid, -1, Str_Normal);
				LoadProject(ProjectName);
	        } else {
	            format(Str_Normal, sizeof Str_Normal, "Project: {00FF00}%s.iTD{FFFFFF} has been created.", inputtext);
			    SendClientMessage(playerid, -1, Str_Normal);
	        }
	        ProjectSaved = false;
	        if(!ListCheck(inputtext)) AddProject(inputtext);
	        SaveProject(ProjectName);
	        LoadProject(ProjectName);
	        ShowDrawMenu(playerid);
	        return true;
	    }
	    
	    case DIALOG_EDITTEXT:
	    {
	        if(!response) { ShowDrawMenu(playerid); return true; }
	        if(!strlen(inputtext)) { OnPlayerClickTextDraw(playerid, TD_Menu[11]); return true; }
	        SaveUndo(CurrentID);
			format(EditDraw[CurrentID][TSTR], 128, "%s", inputtext);
			RecreateTextDraw();
	    }
	    
	    case DIALOG_CREATE:
	    {
	        if(!response) ListTexdraws(playerid);
	        switch(listitem)
	        {
	            case 0:
	            {
	                new ID = GetAvailableIndex();
	                if(ID == -1)
	                {
	                    format(Str_Normal, sizeof Str_Normal,
						"Unable to create a new textdraw (Limit Reached: {FF0000}%i{FFFFFF})", MAX_LOADED_TEXTDRAWS);
	                    SendClientMessage(playerid, -1, Str_Normal);
                        ListTexdraws(playerid);
                        return true;
	                }
	                
	                CurrentID = ID;
	                EditMode = EDIT_MODE_CREATE_NORMAL;
	                SendClientMessage(playerid, 0xFFFFFFFF, "Create a {00FF00}Textdraw{FFFFFF}: Press LMB to create, drag to move, release to end.");
	                TempHideMenu(playerid);
	            }
	            case 1:
	            {
	                new ID = GetAvailableIndex();
	                if(ID == -1)
	                {
	                    format(Str_Normal, sizeof Str_Normal,
						"Unable to create a new textdraw (Limit Reached: {FF0000}%i{FFFFFF})", MAX_LOADED_TEXTDRAWS);
	                    SendClientMessage(playerid, -1, Str_Normal);
                        ListTexdraws(playerid);
                        return true;
	                }
	                
	                CurrentID = ID;
	                EditMode = EDIT_MODE_CREATE_UBOX;
	                SendClientMessage(playerid, 0xFFFFFFFF, "Create a {00FF00}Box{FFFFFF}: Press LMB to start, drag to resize, release to end.");
	                TempHideMenu(playerid);
	            }
	            case 2:
	            {
	                new ID = GetAvailableIndex();
	                if(ID == -1)
	                {
	                    format(Str_Normal, sizeof Str_Normal,
						"Unable to create a new textdraw (Limit Reached: {FF0000}%i{FFFFFF})", MAX_LOADED_TEXTDRAWS);
	                    SendClientMessage(playerid, -1, Str_Normal);
                        ListTexdraws(playerid);
                        return true;
	                }

	                CurrentID = ID;
	                EditMode = EDIT_MODE_CREATE_TBOX;
	                SendClientMessage(playerid, 0xFFFFFFFF, "Create a {00FF00}Texture Box{FFFFFF}: Press LMB to start, drag to resize, release to end.");
	                TempHideMenu(playerid);
	            }
	        }
	    }
		case DIALOG_MANAGE:
		{
			if(!response) return true; //{ ShowDrawMenu(playerid); return true; }
			
			if(listitem == 0)
			{
			    ListTexdraws(playerid);
			}
		    if(listitem == 1)
		    {
		        ShowPlayerDialogX(playerid, DIALOG_CREATE, DIALOG_STYLE_LIST, "Add a textdraw:",
				"+ Create Normal Textdraw\n\
				+ Create Box (Uses \"TextDrawUseBox\" method)\n\
				+ Create Texture Box (uses \"LD_SPAC:white\" texture)",
				"OK", "Back");
				
		    } else if (listitem == 2)
		    {
		        if(CurrentID != -1)
		        {
			        SaveUndo(CurrentID);
			        format(Str_Normal, sizeof Str_Normal, "Project: {FF0000}TextDraw (%i){FFFFFF} deleted.", CurrentID);
					SendClientMessage(playerid, -1, Str_Normal);
			        RemoveTextDraw(CurrentID);
				}
		        ListTexdraws(playerid);
		    }
		    
			if(listitem > 2 && response)
			{
			    listitem -= 3;
			    
			    new tmpitem = -1;
			    
			    for(new i=0; i<MAX_LOADED_TEXTDRAWS; i++)
				{
				    if(EditDraw[i][Id] != Text:INVALID_TEXT_DRAW)
				    {
				        tmpitem++;
				        if(tmpitem == listitem)
				        {
				            CurrentID = i;
				            break;
				        }
					}
				}
				
				ListTexdraws(playerid);
			}
			
			if(!TempHide) { TempHideMenu(playerid); ShowDrawMenu(playerid); }
		}
	}
	return false;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(ProjectEditor == playerid)
	{
	    if(!reason && EditMode == EDIT_MODE_TEXT && CurrentID != -1 && (gettime() - DialogResponse) < 10)
	    {
			ApplyUndo();
			printf("Textdraw (%i)'s text has been reset due to client crash", CurrentID);
		}
		if(!ProjectSaved && strlen(ProjectName))
		{
		    SaveProject(ProjectName);
		    ProjectSaved = true;
		}
		HideDrawMenu(playerid);
	}
	return true;
}
