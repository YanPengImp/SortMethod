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
    sort1(a, count);
//    sort2(a, count);
//    insertSort(a, count);
//    sortArr(a, 0, count - 1);
    for (int i = 0; i < count; i++) {
        printf("%d\n", a[i]);
    }
    // Do any additional setup after loading the view, typically from a nib.
}

//冒泡排序
void sort1(int array[],int count) {
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
void sort2(int array[],int count) {
    for (int i = 0; i < count; i++) {
        for (int j = i + 1; j < count; j++) {
            if (array[i] > array[j]) {
                int tmp = array[i];
                array[i] = array[j];
                array[j] = tmp;
            }
        }
    }
}

//插入排序
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
