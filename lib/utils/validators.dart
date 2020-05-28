class Validators {
  static String validateUser(String user) {
    if (user.isEmpty) {
      return 'No. Whatsapp/Email harus diisi';
    }
    return null;
  }

  static String validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (email.isNotEmpty && !regex.hasMatch(email)) {
      return 'Format email salah';
    } else {
      return null;
    }
  }

  static String validatePassLogin(String pass) {
    if (pass.isEmpty) {
      return 'Password harus diisi';
    }
    return null;
  }

  static String validatePass(String pass) {
    if (pass.isEmpty) {
      return 'Password harus diisi';
    } else if (pass.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  static String validateConfirmPass(String pass, String confirmPass) {
    if (confirmPass != pass) {
      return 'Password tidak sama';
    } else {
      return null;
    }
  }

  static String validateName(String name) {
    if (name.isEmpty) {
      return 'Nama harus diisi';
    } else if (!(RegExp(r'^[a-zA-Z\s]+$')).hasMatch(name)) {
      return 'Nama tidak boleh mengandung simbol dan angka';
    } else if (name.length < 2) {
      return 'Nama terlalu singkat';
    }
    return null;
  }

  static String validatePhone(String phone) {
    if (!(RegExp(r'^[0-9]*$')).hasMatch(phone)) {
      return 'Nomor Whatsapp tidak valid';
    } else if (phone.isEmpty) {
      return 'Nomor Whatsapp harus diisi';
    } else if (phone.length > 15) {
      return 'Nomor Whatsapp terlalu panjang';
    } else if (phone.length < 10) {
      return 'Nomor Whatsapp terlalu singkat';
    }
    return null;
  }

  static String validatePhoneLogin(String phone) {
    if (phone.isEmpty) {
      return 'No Whatsapp harus diisi';
    }
    return null;
  }

  static String validateNamaAlamat(String namaAlamat) {
    if (namaAlamat.isEmpty) {
      return 'Nama Alamat harus diisi';
    }
    return null;
  }

  static String validateKecamatan(String kecamatan) {
    if (kecamatan.isEmpty) {
      return 'Kecamatan harus diisi';
    }
    return null;
  }

  static String validateAlamat(String alamat) {
    if (alamat.isEmpty) {
      return 'Alamat harus diisi';
    } else if ((RegExp(r'(\r\n|\r|\n)')).hasMatch(alamat)) {
      return 'Alamat tidak valid';
    }
    return null;
  }

  static String validateOrderCode(String orderCode) {
    if (orderCode.isEmpty) {
      return 'Kode order harus diisi';
    }
    return null;
  }

  static String validateVoucher(String voucher) {
    if (voucher.isEmpty) {
      return 'Kode Promo harus diisi';
    }
    return null;
  }

  static String validateForgotPass(String phone) {
    if (phone.isEmpty) {
      return 'No Whatsapp harus diisi';
    }
    return null;
  }

  static String validateJudulAlbum(String judulAlbum) {
    if (judulAlbum.isEmpty) {
      return 'Judul album harus diisi';
    }
    return null;
  }
}
