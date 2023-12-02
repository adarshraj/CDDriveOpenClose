
include windows.inc
include kernel32.inc
include user32.inc
include comctl32.inc
include winmm.inc

includelib kernel32.lib
includelib user32.lib
includelib comctl32.lib
includelib winmm.lib

DlgProc	proto	:HWND, :UINT, :WPARAM, :LPARAM

.data
szDialogCaption	db		"CD Drive Open & Close",0
szOpen    		db      'set cdaudio door open',0       
szClose   		db      'set cdaudio door closed',0   

.data?
hInstance	HINSTANCE ?

.const
IDD_DLGBOX	equ	1001
IDC_EXIT	equ	1002
IDC_OPEN	equ	1003
IDC_CLOSE	equ	1004
APP_ICON	equ	2000

