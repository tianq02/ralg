#include <iostream>
#include <fstream>
#include <chrono>       //实现高精度计时
#include "gnuplot.h"
#include "qsort.h"

#define STEP 1000
#define MAX 100000

std::chrono::system_clock::time_point _tic, _toc;

//ref:https://blog.csdn.net/whutshiliu/article/details/106989658
auto tic() {
    _tic = std::chrono::system_clock::now();
    return _tic;
}
auto toc() {
    _toc = std::chrono::system_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(_toc - _tic);
    auto n_us_time = (duration.count()) * std::chrono::microseconds::period::num;
    std::cout << n_us_time << "\t";// << std::endl;
    return n_us_time;
}

int main()
{
    std::ofstream out;
    out.open("file.txt", std::ios::out | std::ios::trunc);

    std::cout << "size\trand\tnorm\n";
    int* a = new int[MAX] {};
    int* b = new int[MAX] {};
    for (int i = 0; i < MAX; i++) {
        a[i] = rand();
    }


    // ref:https://www.runoob.com/data-structures/random-quick-sort.html
    // 如果是对近乎有序的数组进行快速排序，
    // 每次 partition 分区后子数组大小极不平衡，容易退化成 O(n^2) 的时间复杂度算法。
    // 我们需要对上述代码进行优化，随机选择一个基点做为比较，称为随机化快速排序算法。
    // 只需要在上述代码前加上下面一行，随机选择数组中一数据和基点数据进行交换。
    // swap( arr, l , (int)(Math.random()*(r-l+1))+l );

    //在数据整体有序时，随机化算法优势最大
    qs::qsort(a, 0, MAX, true, 1000);    //划分至区域大小1000停止(抖动区域1000)

    for (int n = STEP; n < MAX; n += STEP) {

        for (int i = 0; i < n; i++) b[i] = a[i];
        out << "\n" << n << "\t";   std::cout << "\n" << n << "\t";
        tic(); qs::qsort(a, 0, n, true); out << toc() << "\t";

        for (int i = 0; i < n; i++) a[i] = b[i];
        tic(); qs::qsort(b, 0, n, false); out << toc() << "\t";
    }
    delete[]a, b;
    out.close();
    GnuplotPipe gp;
    gp.sendLine("plot \"file.txt\" using 1:2 title \"rand\" w l ,\'\' using 1:3 title \"norm\" w l");
}
