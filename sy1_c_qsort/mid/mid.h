#ifndef MID_H
#define MID_H

#include <random>

namespace my {

	//交换
	void swap(int& a, int& b) {
		int c = a;
		a = b;
		b = c;
		//std::cout << "swap(" << a << ";" << b <<")\n" ;
	};

	int min(int* a, int l, int r) {
		int p = a[l];
		for (int i = l; i <= r; i++) {

		}
	}

	//三分返回
	struct p_res {
		int left, right, key;
	};

	//三从划分
	p_res part(int* to_part, int left, int right, bool is_rand = true) {

		//轴值选取（无补偿）
		int key_index = is_rand ? (rand() % (right - left + 1) + left) : left;
		//轴值选取（有随机化补偿）
		//int rval = rand() % (right - left + 1) + left;
		//int key_index = is_rand ? rval : left;

		int key_val = to_part[key_index];

		//i:当前元素，p_l:左侧最后，p_r:右侧位置
		int i = left, p_left = left, p_right = right;

		//无需额外空间的三从划分
		//https://blog.csdn.net/CSMrZ/article/details/81974470
		while (i <= p_right) {
			int cmp = to_part[i];
			if (cmp < key_val)	swap(to_part[i++], to_part[p_left++]);
			else if (cmp > key_val)	swap(to_part[i], to_part[p_right--]);
			else i++;
		}

		return p_res{ p_left,p_right,key_val };
	}

	//使用三从划分的快速排序
	int qsort(int* to_sort, int left, int right, bool is_rand = true, int jitter = 0) {

		if (left + jitter < right) {		//排序未完成
			p_res part_res = part(to_sort, left, right, is_rand);	//执行划分
			qsort(to_sort, left, part_res.left - 1, is_rand);		//排序左半
			qsort(to_sort, part_res.right + 1, right, is_rand);		//排序右半
			return 0;
		}
		else {
			return 1 + 1;	//finished
		}

	}

	//输入简化
	template <size_t N>
	int qsort(int(&to_sort)[N], bool is_rand = true) {
		return qsort(&to_sort, 0, N - 1, is_rand);
	}

	//使用三从划分的次序搜索，返回指定下标的数，递归实现
	int findr(int* to_sort, int left, int right, int pos, bool is_rand = true) {
		p_res part_res = part(to_sort, left, right, is_rand);	//执行划分
		if (part_res.left > pos) return findr(to_sort, left, part_res.left - 1, pos, is_rand);	//数在左侧
		else if (right < pos) return findr(to_sort, part_res.right + 1, right, pos, is_rand);	//数在右侧
		else return part_res.key;
	}

	//非递归实现次序搜索
	int find(int* to_sort, int left, int right, int pos, bool is_rand = true) {
		while (1) {
			p_res part_res = part(to_sort, left, right, is_rand);			//执行划分
			if (part_res.left > pos) right = part_res.left - 1;				//在左侧
			else if (part_res.right < pos) left = part_res.right + 1;		//右侧
			else return part_res.key;	//在区间中，返回当前轴值
		}
	}

	//获取中位数
	double mid(int* a, int left, int right, bool is_rand = true) {
		int pos = floor(left + right) / 2;
		int l = find(a, left, right, pos, is_rand);
		if ((right - left+1) % 2 == 1) {
			return l;
		}
		else {
			int min = a[pos + 1];
			if (min == l) return l;
			for (int i = pos + 1; i < right; i++) {
				if (a[i] < min) min = a[i];
			}
			return (l + min) / 2;
		}
		
	}

}

#endif // !MID_H

