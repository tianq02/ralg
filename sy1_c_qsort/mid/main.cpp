// main.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include <iostream>
#include <vector>
#include <fstream>
#include <chrono>
#include "mid.h"
#include "tictoc.h"
#include "gnuplot.h"

#define STEP 1000
#define MAX 100000

using namespace std;



int _main()
{
    std::cout << "Hello World!\n";
    int* a = new int[MAX];

    for (int i = 0; i < MAX; i++) {
        cout << (a[i] = rand() % 10) << "\t";
    }
    cout << endl;

    cout <<my::find(a, 0, 9, 5)<< endl;

    my::qsort(a, 0, 9, true);
    for (int i = 0; i < MAX; i++) {
        cout << a[i] << "\t";
    }
}
int main() {
    std::ofstream out;
    out.open("file.txt", std::ios::out | std::ios::trunc);

    srand((unsigned int)time(0));
    int* a = new int[MAX];  //随机数组
    int* b = new int[MAX];  //临时。用于内排序

    for (int i = 0; i < MAX; i++) {
        a[i] = rand();
    }

    my::qsort(a, 0, MAX - 1, false, 1000);

    for (int i = STEP; i <= MAX; i += STEP) {
        out << i << "\t"; cout << i << "\t";
        for (int j = 0; j <= i; j++) { b[j] = a[j]; }
        tic(); cout << my::find(b, 0, i, (int)(i / 2), true); out << toc() << "\t";
        for (int j = 0; j <= i; j++) { b[j] = a[j]; }
        tic(); cout << my::find(b, 0, i, (int)(i / 2), false); out << toc() << "\t";
        out << "\n"; cout << "\n";
    }

    delete[]a, b;
    out.close();
    GnuplotPipe gp;
    gp.sendLine("plot \"file.txt\" using 1:2 title \"rand\" w l ,\'\' using 1:3 title \"norm\" w l");
}

//class Solution {
//    //链接：https ://leetcode.cn/circle/article/LJxP6W/
//public:
//    int binarySearch(vector<int>& nums, int left, int right, int target) {
//        if (left > right) {
//            return -1;
//        }
//        int offset = rand() % (right - left + 1);
//        int mid = left + offset;
//        if (nums[mid] == target) {
//            return mid;
//        }
//        else if (nums[mid] > target) {
//            return binarySearch(nums, left, mid - 1, target);
//        }
//        else {
//            return binarySearch(nums, mid + 1, right, target);
//        }
//    }
//    int search(vector<int>& nums, int target) {
//        return binarySearch(nums, 0, (int)nums.size() - 1, target);
//    }
//};