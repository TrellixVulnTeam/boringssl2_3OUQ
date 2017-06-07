# This file is created by generate_build_files.py. Do not edit manually.

test_support_sources = [
    "src/crypto/asn1/asn1_locl.h",
    "src/crypto/bio/internal.h",
    "src/crypto/bytestring/internal.h",
    "src/crypto/cipher_extra/internal.h",
    "src/crypto/conf/conf_def.h",
    "src/crypto/conf/internal.h",
    "src/crypto/curve25519/internal.h",
    "src/crypto/digest_extra/internal.h",
    "src/crypto/evp/internal.h",
    "src/crypto/fipsmodule/aes/internal.h",
    "src/crypto/fipsmodule/bn/internal.h",
    "src/crypto/fipsmodule/bn/rsaz_exp.h",
    "src/crypto/fipsmodule/cipher/internal.h",
    "src/crypto/fipsmodule/delocate.h",
    "src/crypto/fipsmodule/des/internal.h",
    "src/crypto/fipsmodule/digest/internal.h",
    "src/crypto/fipsmodule/digest/md32_common.h",
    "src/crypto/fipsmodule/ec/internal.h",
    "src/crypto/fipsmodule/ec/p256-x86_64-table.h",
    "src/crypto/fipsmodule/ec/p256-x86_64.h",
    "src/crypto/fipsmodule/modes/internal.h",
    "src/crypto/fipsmodule/rand/internal.h",
    "src/crypto/fipsmodule/rsa/internal.h",
    "src/crypto/internal.h",
    "src/crypto/obj/obj_dat.h",
    "src/crypto/pkcs7/internal.h",
    "src/crypto/pkcs8/internal.h",
    "src/crypto/poly1305/internal.h",
    "src/crypto/pool/internal.h",
    "src/crypto/test/file_test.cc",
    "src/crypto/test/file_test.h",
    "src/crypto/test/gtest_main.h",
    "src/crypto/test/test_util.cc",
    "src/crypto/test/test_util.h",
    "src/crypto/x509/charmap.h",
    "src/crypto/x509/internal.h",
    "src/crypto/x509/vpm_int.h",
    "src/crypto/x509v3/ext_dat.h",
    "src/crypto/x509v3/pcy_int.h",
    "src/ssl/internal.h",
    "src/ssl/test/async_bio.h",
    "src/ssl/test/packeted_bio.h",
    "src/ssl/test/test_config.h",
]


crypto_test_sources = [
    "crypto_test_data.cc",
    "src/crypto/asn1/asn1_test.cc",
    "src/crypto/base64/base64_test.cc",
    "src/crypto/bio/bio_test.cc",
    "src/crypto/bytestring/bytestring_test.cc",
    "src/crypto/chacha/chacha_test.cc",
    "src/crypto/cipher_extra/aead_test.cc",
    "src/crypto/cipher_extra/cipher_test.cc",
    "src/crypto/cmac/cmac_test.cc",
    "src/crypto/compiler_test.cc",
    "src/crypto/constant_time_test.cc",
    "src/crypto/curve25519/ed25519_test.cc",
    "src/crypto/curve25519/spake25519_test.cc",
    "src/crypto/curve25519/x25519_test.cc",
    "src/crypto/dh/dh_test.cc",
    "src/crypto/digest_extra/digest_test.cc",
    "src/crypto/dsa/dsa_test.cc",
    "src/crypto/ecdh/ecdh_test.cc",
    "src/crypto/err/err_test.cc",
    "src/crypto/evp/evp_extra_test.cc",
    "src/crypto/evp/pbkdf_test.cc",
    "src/crypto/fipsmodule/aes/aes_test.cc",
    "src/crypto/fipsmodule/bn/bn_test.cc",
    "src/crypto/fipsmodule/ec/ec_test.cc",
    "src/crypto/fipsmodule/modes/gcm_test.cc",
    "src/crypto/fipsmodule/rand/ctrdrbg_test.cc",
    "src/crypto/hkdf/hkdf_test.cc",
    "src/crypto/hmac_extra/hmac_test.cc",
    "src/crypto/lhash/lhash_test.cc",
    "src/crypto/obj/obj_test.cc",
    "src/crypto/pkcs7/pkcs7_test.cc",
    "src/crypto/pkcs8/pkcs12_test.cc",
    "src/crypto/pkcs8/pkcs8_test.cc",
    "src/crypto/poly1305/poly1305_test.cc",
    "src/crypto/pool/pool_test.cc",
    "src/crypto/refcount_test.cc",
    "src/crypto/rsa_extra/rsa_test.cc",
    "src/crypto/test/file_test_gtest.cc",
    "src/crypto/test/gtest_main.cc",
    "src/crypto/thread_test.cc",
    "src/crypto/x509/x509_test.cc",
]

ssl_test_sources = [
    "src/crypto/test/gtest_main.cc",
    "src/ssl/ssl_test.cc",
]
def create_tests(copts, crypto, ssl):
  native.cc_test(
      name = "evp_test",
      size = "small",
      srcs = ["src/crypto/evp/evp_test.cc"] + test_support_sources,
      args = [
          "$(location src/crypto/evp/evp_tests.txt)",
      ],
      copts = copts + ["-DBORINGSSL_SHARED_LIBRARY"],
      data = [
          "src/crypto/evp/evp_tests.txt",
      ],
      deps = [crypto],
  )

  native.cc_test(
      name = "ecdsa_sign_test",
      size = "small",
      srcs = ["src/crypto/fipsmodule/ecdsa/ecdsa_sign_test.cc"] + test_support_sources,
      args = [
          "$(location src/crypto/fipsmodule/ecdsa/ecdsa_sign_tests.txt)",
      ],
      copts = copts + ["-DBORINGSSL_SHARED_LIBRARY"],
      data = [
          "src/crypto/fipsmodule/ecdsa/ecdsa_sign_tests.txt",
      ],
      deps = [crypto],
  )

  native.cc_test(
      name = "ecdsa_test",
      size = "small",
      srcs = ["src/crypto/fipsmodule/ecdsa/ecdsa_test.cc"] + test_support_sources,
      copts = copts + ["-DBORINGSSL_SHARED_LIBRARY"],
      deps = [crypto],
  )

  native.cc_test(
      name = "ecdsa_verify_test",
      size = "small",
      srcs = ["src/crypto/fipsmodule/ecdsa/ecdsa_verify_test.cc"] + test_support_sources,
      args = [
          "$(location src/crypto/fipsmodule/ecdsa/ecdsa_verify_tests.txt)",
      ],
      copts = copts + ["-DBORINGSSL_SHARED_LIBRARY"],
      data = [
          "src/crypto/fipsmodule/ecdsa/ecdsa_verify_tests.txt",
      ],
      deps = [crypto],
  )

  native.cc_test(
      name = "example_mul",
      size = "small",
      srcs = ["src/crypto/fipsmodule/ec/example_mul.c"] + test_support_sources,
      copts = copts + ["-DBORINGSSL_SHARED_LIBRARY"],
      deps = [crypto],
  )

  native.cc_test(
      name = "p256-x86_64_test",
      size = "small",
      srcs = ["src/crypto/fipsmodule/ec/p256-x86_64_test.cc"] + test_support_sources,
      args = [
          "$(location src/crypto/fipsmodule/ec/p256-x86_64_tests.txt)",
      ],
      copts = copts + ["-DBORINGSSL_SHARED_LIBRARY"],
      data = [
          "src/crypto/fipsmodule/ec/p256-x86_64_tests.txt",
      ],
      deps = [crypto],
  )

  native.cc_test(
      name = "tab_test",
      size = "small",
      srcs = ["src/crypto/x509v3/tab_test.c"] + test_support_sources,
      copts = copts + ["-DBORINGSSL_SHARED_LIBRARY"],
      deps = [crypto],
  )

  native.cc_test(
      name = "v3name_test",
      size = "small",
      srcs = ["src/crypto/x509v3/v3name_test.c"] + test_support_sources,
      copts = copts + ["-DBORINGSSL_SHARED_LIBRARY"],
      deps = [crypto],
  )
