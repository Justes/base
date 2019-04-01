<?php

namespace App\Models;

class CloudServ extends BaseModel
{
	public function lang() {
		return $this->hasMany('App\Models\CloudServLang', 'serv_id');
	}

	public function withTitle($data) {
		return $this->where([
				'status' => 0,
				'plt' => $data['plt'],
				'csl.lang' => $data['lang'],
				'cloud_servs.type' => $data['type']
			])
			->leftJoin('cloud_serv_langs as csl', function($join) {
				$join->on('cloud_servs.id', '=', 'csl.serv_id');
			})
			->get();
	}
}
