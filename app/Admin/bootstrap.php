<?php
use Encore\Admin\Grid;
use Encore\Admin\Form;

/**
 * Laravel-admin - admin builder based on Laravel.
 * @author z-song <https://github.com/z-song>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 * Encore\Admin\Form::forget(['map', 'editor']);
 *
 * Or extend custom form field:
 * Encore\Admin\Form::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */

//使用本地resource目录模板
app('view')->prependNamespace('admin', resource_path('views'));

Form::forget(['map', 'editor']);

Form::init(function (Form $form) {

    $form->disableEditingCheck();

    $form->disableCreatingCheck();

    $form->disableViewCheck();

    $form->tools(function (Form\Tools $tools) {
//        $tools->disableDelete();
//        $tools->disableView();
//        $tools->disableList();
    });
});

Grid::init(function (Grid $grid) {

//    $grid->disableActions();
//
//    $grid->disablePagination();
//
//    $grid->disableCreateButton();
//
//    $grid->disableFilter();

    $grid->disableRowSelector();

//    $grid->disableTools();

    $grid->disableExport();

    $grid->actions(function (Grid\Displayers\Actions $actions) {
        $actions->disableView();
        $actions->disableEdit();
        $actions->disableDelete();
    });
});