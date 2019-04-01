<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class BaseModel extends Model{
	protected $guarded = [];
	protected $hidden = ['updated_at', 'deleted_at'];

	public function columns() {
		return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
	}

	public function updateBy($id, $data) {
		return $this->where('id', $id)->update($data);
	}
}
