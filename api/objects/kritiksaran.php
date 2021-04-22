<?php

class KritikSaran  {

		private $conn;
		private $table_nama = "ref_bantuan";

        public $id_kritiksaran;
		public $nama_pemberi_saran;
        public $email_pemberi_saran;
        public $pesannya;
        public $startPage;
        public $dataPerPage;
		
		public function __construct($db){
			$this->conn = $db;
		}
		public function read(){
			$query = "SELECT * FROM ".$this->table_nama;

			$stmt = $this->conn->prepare($query);
			$stmt->execute();

			return $stmt;
		}
        public function readPagination(){
            $query = "SELECT * FROM ".$this->table_nama. " LIMIT $this->startPage, $this->dataPerPage";

			$stmt = $this->conn->prepare($query);
			$stmt->execute();

			return $stmt;
        }

        public function ambilPesan(){
			$query = "SELECT pesan FROM ".$this->table_nama. " WHERE id_bantuan = $this->id_kritiksaran";

			$stmt = $this->conn->prepare($query);
			$stmt->execute();

			$row = $stmt->fetch(PDO::FETCH_ASSOC);
          
            // set values to object properties
            $this->pesannya = $row['pesan'];
		}
	}
?>