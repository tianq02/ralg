#ifndef TICTOC_H
#define TICTOC_H

#include <iostream>
#include <chrono>

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

#endif // !TICTOC_H

