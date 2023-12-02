.686
.model flat, stdcall
option casemap: none

include Template.inc

.code
start:
	invoke GetModuleHandle, NULL
	mov hInstance, eax
	invoke InitCommonControls
	invoke DialogBoxParam, hInstance, IDD_DLGBOX, NULL, addr DlgProc, NULL
	invoke ExitProcess, NULL
	
DlgProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
	.if uMsg == WM_INITDIALOG
		invoke SetWindowText, hWnd, addr szDialogCaption
		invoke LoadIcon, hInstance, APP_ICON
		invoke SendMessage, hWnd, WM_SETICON, 1, eax
	.elseif uMsg == WM_COMMAND
		mov eax, wParam
		.if eax == IDC_EXIT
			invoke SendMessage, hWnd, WM_CLOSE,0, 0
		.elseif eax == IDC_OPEN
			invoke mciSendString, addr szOpen,0,0,0
		.elseif eax == IDC_CLOSE
			invoke mciSendString, addr szClose,0,0,0	
		.endif
	.elseif uMsg == WM_CLOSE
		invoke EndDialog, hWnd, 0
	.endif
	
	xor eax, eax			
	Ret
DlgProc EndP	
end start
