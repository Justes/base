<?php

namespace App\Admin\Controllers;

use App\Models\App;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class AppController extends Controller
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
        $grid = new Grid(new App);

        $grid->id('Id');
        $grid->plt('Plt');
        $grid->name('Name');
        $grid->no('No');
        $grid->plt_token('Plt token');
        $grid->env('Env');
        $grid->created_at('Created at');

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
        $show = new Show(App::findOrFail($id));

        $show->id('Id');
        $show->plt('Plt');
        $show->name('Name');
        $show->no('No');
        $show->plt_key('Plt key');
        $show->plt_secret('Plt secret');
        $show->plt_token('Plt token');
        $show->plt_test_key('Plt test key');
        $show->plt_test_secret('Plt test secret');
        $show->refresh_token_time('Refresh token time');
        $show->expire_time('Expire time');
        $show->env('Env');
        $show->fcm_server_key('Fcm server key');
        $show->jpush_key('Jpush key');
        $show->jpush_secret('Jpush secret');
        $show->baidu_voice_id('Baidu voice id');
        $show->baidu_voice_key('Baidu voice key');
        $show->baidu_voice_secret('Baidu voice secret');
        $show->sms_id('Sms id');
        $show->sms_tpl_id('Sms tpl id');
        $show->sms_key('Sms key');
        $show->sms_sign('Sms sign');
        $show->qiniu_key('Qiniu key');
        $show->qiniu_secret('Qiniu secret');
        $show->per_page('Per page');
        $show->ios('Ios');
        $show->android('Android');
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
        $form = new Form(new App);

        $form->number('plt', 'Plt');
        $form->text('name', 'Name');
        $form->text('no', 'No');
        $form->text('plt_key', 'Plt key');
        $form->text('plt_secret', 'Plt secret');
        $form->text('plt_token', 'Plt token');
        $form->text('plt_test_key', 'Plt test key');
        $form->text('plt_test_secret', 'Plt test secret');
        $form->text('refresh_token_time', 'Refresh token time');
        $form->text('expire_time', 'Expire time')->default('315360000');
        $form->switch('env', 'Env')->default(1);
        $form->text('fcm_server_key', 'Fcm server key');
        $form->text('jpush_key', 'Jpush key');
        $form->text('jpush_secret', 'Jpush secret');
        $form->text('baidu_voice_id', 'Baidu voice id');
        $form->text('baidu_voice_key', 'Baidu voice key');
        $form->text('baidu_voice_secret', 'Baidu voice secret');
        $form->text('sms_id', 'Sms id');
        $form->text('sms_tpl_id', 'Sms tpl id');
        $form->text('sms_key', 'Sms key');
        $form->text('sms_sign', 'Sms sign');
        $form->text('qiniu_key', 'Qiniu key');
        $form->text('qiniu_secret', 'Qiniu secret');
        $form->switch('per_page', 'Per page')->default(10);
        $form->text('ios', 'Ios');
        $form->text('android', 'Android');

        return $form;
    }
}
