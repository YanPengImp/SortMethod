//
//  ViewController.m
//  QuickSort
//
//  Created by Imp on 2018/2/23.
//  Copyright © 2018年 codoon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    int a[12] = {83,25,35,14,33,63,84,28,62,93,34,64};
    int count = sizeof(a) / sizeof(a[0]);
//    bubblingSort(a, count);
//    selectSort(a, count);
//    insertSort(a, count);
//    sortArr(a, 0, count - 1);
//    shellSort(a,count);
    int *b = mergeSort(a, count);
    for (int i = 0; i < count; i++) {
        printf("%d\n", b[i]);
    }
    // Do any additional setup after loading the view, typically from a nib.
}

//冒泡排序
//两两比较交换 O(n*n)
void bubblingSort(int array[],int count) {
    for (int i = 0; i < count - 1; i++) {
        for (int j = 0; j < count - 1 - i; j++) {
            if (array[j] > array[j + 1]) {
                int tmp = array[j];
                array[j] = array[j+1];
                array[j+1] = tmp;
            }
        }
    }
}

//选择排序
//每一次找到最小值，然后和第一个数交换 O(n*n)
void selectSort(int array[],int count) {
    for (int i = 0; i < count - 1; i++) {
        int minIndex = i;
        for (int j = i + 1; j < count; j++) {
            if (array[minIndex] > array[j]) {
                minIndex = j;
            }
        }
        if (minIndex != i) {
            int tmp = array[i];
            array[i] = array[minIndex];
            array[minIndex] = tmp;
        }
    }
}

//插入排序
//前面都是有序 后面无序，遍历如果比之前有序的最后一位小，就依次把前面的有序往后移动一位。 O(n*n)
void insertSort(int array[],int count) {
    for (int i = 0; i < count; i++) {
        int j = i;
        int insert = array[i];
        while (j > 0 && insert < array[j - 1]) {
            array[j] = array[j-1];
            j--;
        }
        array[j] = insert;
    }
}

//快速排序
//找到中间index位于左边的都小 右边的都大，再对左右序列分别排序 O(n*logn)
void sortArr(int array[], int left, int right) {
    if (left >= right) {
        return;
    }
    int index = quickSort(array, left, right);
    sortArr(array, left, index - 1);
    sortArr(array, index + 1, right);
}

int quickSort(int array[], int left, int right) {
    int keyNum = array[left];
    while (left < right) {
        while (left < right && array[right] >= keyNum) {
            right--;
        }
        array[left] = array[right];
        while (left < right && array[left] <= keyNum) {
            left++;
        }
        array[right] = array[left];
    }
    array[left] = keyNum;
    return left;
}

//希尔排序
//每次把序列分成间隔count/2的子序列 分别进行插入排序。直到count=1
void shellSort(int array[], int count) {
    int interval = count / 2;
    while (interval > 0) {
        for (int i = interval; i < count; i++) {
            int tmp = array[i];
            int index = i - interval;
            while (index >= 0 && tmp < array[index]) {
                array[index + interval] = array[index];
                index -= interval;
            }
            array[index + interval] = tmp;
        }
        interval /= 2;
    }
}

//归并排序
int* mergeSort(int array[], int count) {
    int length = count / 2;
    int leftArr[length];
    int rightArr[count - length];
    for (int i = 0; i < count; i++) {
        if (i < length) {
            leftArr[i] = array[i];
        } else {
            rightArr[i-length] = array[i];
        }
    }
    return merge(mergeSort(leftArr, length), length, mergeSort(rightArr, count - length), count - length);
}

int* merge(int letfArr[], int lefLength, int rightArr[], int rightLength) {
    int i = 0, j = 0;
    int res[lefLength+rightLength];
    for (int index = 0; index < lefLength+rightLength; index++) {
        if (index>i) {
            res[index] = rightArr[j++];
        } else if (index>j) {
            res[index] = letfArr[i++];
        } else if (letfArr[i]<rightArr[j]) {
            res[index] = letfArr[i++];
        } else {
            res[index] = rightArr[j++];
        }
    }
    return res;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
