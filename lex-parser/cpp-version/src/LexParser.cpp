//
// Created by 沈原灏 on 2023-10-09.
//
#include "../include/LexParser.h"

void show_title_info()
{
    printf("----------------------------------WELCOME----------------------------------\n\n");
    printf("\t@Version: 0.2.6\n");
    printf("\t@Encoding: UTF-8\n");
    printf("\t@Copyright: BUPT\n");
    printf("\t@Teacher: Liu Chen\n");
    printf("\t@Author: AryCra07\n");
    printf("\t@Description: A Lexical Parser for course Compiler Principles\n");
    printf("\t@Usage: LexParser <file_to_parse_name> [outfile_name]\n");
    printf("\t@Hints1: If [outfile_name] is empty, the result will be printed to the console.\n");
    printf("\t@Hints2: Don't put any Chinese char into your source file, it may output some garbled codes!\n\n");
    printf("---------------------------------------------------------------------------\n\n");
}

int main(int argc, char *argv[])
{
    show_title_info();

    // Start timer
    clock_t start, end;
    start = clock();
    // No arguments
    if (argc < 2)
    {
        cout << endl
             << "Usage: LexParser <file_to_parse_name> [outfile_name]" << endl
             << endl;

        return -1;
    }
    // Get file name
    string inFile, inFilePrefix, inFilePath;
    inFilePrefix = "data/in/";
    inFile = argv[1];
    inFilePath = inFilePrefix + inFile;

    // Create parser object
    parser myParser(inFilePath);

    // Open parse file failed
    if (myParser.file.fail())
    {
        cout << endl
             << "Error: File to parse open failed." << endl;
        cout << "Usage: LexParser <file_to_parse_name> [outfile_name]" << endl
             << endl;
        return -1;
    }
    ostringstream outStream;
    outStream << "========Tokens========" << endl;
    // Parse file
    outStream << myParser.parseFile();
    // Output info
    outStream << endl
              << "========Info========" << endl
              << "[Char count]  " << myParser.countChar() << endl
              << "[Line count]  " << myParser.countLine() << endl;
    outStream << "[Error count] " << myParser.errorCount << endl;
    // Output to file
    if (argc > 2)
    {
        ofstream outFile;
        string outDir, outDirPrefix, outDirPath;
        // Get output file name
        outDir = argv[2];
        outDirPrefix = "data/out/";
        outDirPath = outDirPrefix + outDir;
        // Open output file
        outFile.open(outDirPath);
        // Open output file failed
        if (outFile.fail())
        {
            cout << endl
                 << "Error: Outfile open failed." << endl;
            cout << "Usage: LexParser <file_to_parse_name> [outfile_name]" << endl
                 << endl;
            return -1;
        }
        // End timer
        end = clock();
        // Output to file
        outFile << outStream.str() << endl
                << "Parsing time: " << end - start << "ms" << endl
                << "========Thanks for your using:)========" << endl;
        cout << "Parsering is completed!" << endl
             << "========Thanks for your using:)========" << endl;
    }
    else // Output to console
    {
        // End timer
        end = clock();
        // Output to console
        cout << outStream.str() << endl
             << "Parsing time: " << end - start << "ms" << endl;
        cout << "========Thanks for your using:)========" << endl;
    }
    return 0;
}