<?php

namespace App\Admin\Controllers;

use App\Models\User;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class UserController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('Index')
            ->description('description')
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('Detail')
            ->description('description')
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('Edit')
            ->description('description')
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('Create')
            ->description('description')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User);
		$grid->disableCreateButton();
		$grid->model()->orderBy('id', 'desc');

        $grid->id('Id');
        $grid->plt('平台');
        $grid->username('账号');
        $grid->nickname('昵称');
        $grid->tel('电话');
        $grid->email('邮箱');
        $grid->status('状态');
        $grid->regid('推送ID');
        $grid->created_at('创建时间');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->like('username', '账号');
		});

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(User::findOrFail($id));

        $show->id('Id');
        $show->plt('Plt');
        $show->username('Username');
        $show->nickname('Nickname');
        $show->tel('Tel');
        $show->password('Password');
        $show->email('Email');
        $show->email_verified_at('Email verified at');
        $show->profile('Profile');
        $show->reg_ip('Reg ip');
        $show->last_login_time('Last login time');
        $show->last_login_ip('Last login ip');
        $show->status('Status');
        $show->login_times('Login times');
        $show->regid('Regid');
        $show->lang('Lang');
        $show->qq_open_id('Qq open id');
        $show->wx_open_id('Wx open id');
        $show->error_time('Error time');
        $show->attempts('Attempts');
        $show->freeze_time('Freeze time');
        $show->remember_token('Remember token');
        $show->created_at('Created at');
        $show->updated_at('Updated at');
        $show->deleted_at('Deleted at');

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new User);

        $form->number('plt', 'Plt');
        $form->text('username', 'Username');
        $form->text('nickname', 'Nickname');
        $form->text('tel', 'Tel');
        $form->password('password', 'Password');
        $form->email('email', 'Email');
        $form->datetime('email_verified_at', 'Email verified at')->default(date('Y-m-d H:i:s'));
        $form->text('profile', 'Profile');
        $form->text('reg_ip', 'Reg ip');
        $form->datetime('last_login_time', 'Last login time')->default(date('Y-m-d H:i:s'));
        $form->text('last_login_ip', 'Last login ip');
        $form->switch('status', 'Status');
        $form->number('login_times', 'Login times');
        $form->text('regid', 'Regid');
        $form->text('lang', 'Lang');
        $form->text('qq_open_id', 'Qq open id');
        $form->text('wx_open_id', 'Wx open id');
        $form->text('error_time', 'Error time');
        $form->switch('attempts', 'Attempts');
        $form->text('freeze_time', 'Freeze time');
        $form->text('remember_token', 'Remember token');

        return $form;
    }
}
