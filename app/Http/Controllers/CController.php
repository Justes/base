<?php

namespace App\Http\Controllers;

class CController extends Controller {

	protected $req;
	protected $model;
	protected $data;

	public function index() {
		if(isset($this->data['num'])) {
			$v = $this->model->paginate($this->data['num']);
		} else {
			$v = $this->model->all();
		}
		return res($v);
	}

	public function store() {
	}

	public function create() {
		$v = $this->model->create($this->data);
		return res($v);
	}

	public function show($id) {
		$v = $this->model->find($id);
		return res($v);
	}

	public function update($id) {
		$v = $this->model->update($this->data, $id);
		return res($v);
	}

	public function destroy($id) {
		$v = $this->model->destroy($id);
		return res($v);
	}

	public function edit($id) {
		$v = $this->model->find($id);
		return res($v);
	}
}
