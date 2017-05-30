#include<windows.h>
#include<stdio.h>
int main()
{
	HANDLE hComm;

	for (int t = 0; t < 20; t++) {
		char num[255];
		_itoa_s(t,num,10);

		char str[255];

		strcpy_s(str, "\\\\.\\COM");
		strcat_s(str, num);
		hComm = CreateFile(str,                //port name
			GENERIC_READ | GENERIC_WRITE, //Read/Write
			0,                            // No Sharing
			NULL,                         // No Security
			OPEN_EXISTING,// Open existing port only
			0,            // Non Overlapped I/O
			NULL);        // Null for Comm Devices

		if (hComm == INVALID_HANDLE_VALUE)
			printf("Nao esta conectado na porta %d ...\n",t);
		else {
		
			printf("Esta conectado na porta %d ...\n", t);
			
			break;
		}
		Sleep(1000);
	}

	DCB dcbSerialParams = { 0 }; // Initializing DCB structure
	dcbSerialParams.DCBlength = sizeof(dcbSerialParams);

	dcbSerialParams.BaudRate = CBR_9600;  // Setting BaudRate = 9600
	dcbSerialParams.ByteSize = 8;         // Setting ByteSize = 8
	dcbSerialParams.StopBits = ONESTOPBIT;// Setting StopBits = 1
	dcbSerialParams.Parity = NOPARITY;  // Setting Parity = None

	while (1) {
		puts("insira um valor:\n");
		char lpBuffer[]="1";
		lpBuffer[0] = getchar();
		printf("char: %c\n",lpBuffer[0]);
		getchar();

		DWORD dNoOFBytestoWrite;         // No of bytes to write into the port
		DWORD dNoOfBytesWritten = 0;     // No of bytes written to the port
		dNoOFBytestoWrite = 1;


		WriteFile(hComm,        // Handle to the Serial port
			lpBuffer,     // Data to be written to the port
			dNoOFBytestoWrite,  //No of bytes to write
			&dNoOfBytesWritten, //Bytes written
			NULL);

		Sleep(1000*(atoi(lpBuffer)+1));
	}

	CloseHandle(hComm);//Closing the Serial Port
	
	return 0;
}