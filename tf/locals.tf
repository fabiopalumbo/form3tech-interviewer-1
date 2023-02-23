# locals.tf

locals {

    dev {
        env = "development"
        account {
            "db_user":   "account",
            "db_password": "965d3c27-9e20-4d41-91c9-61e6631870e7"
            "policies": ["account-development"],
            "policies_password": "123-account-development"
        }
        gateway {
            "db_user":   "gateway",
            "db_password": "10350819-4802-47ac-9476-6fa781e35cfd"
            "policies": ["gateway-development"],
            "password": "123-gateway-development"
        }
        payment {
            "db_user":   "payment",
            "db_password": "a63e8938-6d49-49ea-905d-e03a683059e7"
            "policies": ["payment-development"],
            "password": "123-payment-development"
        }
    }

    stg {
        env = "staging"
        account {
            "db_user":   "account",
            "db_password": "965d3c27-9e20-4d41-91c9-61e6631870e7"
            "policies": ["account-development"],
            "policies_password": "123-account-development"
        }
        gateway {
            "db_user":   "gateway",
            "db_password": "10350819-4802-47ac-9476-6fa781e35cfd"
            "policies": ["gateway-development"],
            "password": "123-gateway-development"
        }
        payment {
            "db_user":   "payment",
            "db_password": "a63e8938-6d49-49ea-905d-e03a683059e7"
            "policies": ["payment-development"],
            "password": "123-payment-development"
        }
    }

    prod {
        env = "production"
        account {
            "db_user":   "account",
            "db_password": "396e73e7-34d5-4b0a-ae1b-b128aa7f9977"
            "policies": ["account-production"],
            "password": "123-account-production"
        }
        gateway {
            "db_user":   "gateway",
            "db_password": "33fc0cc8-b0e3-4c06-8cf6-c7dce2705329"
            "policies": ["gateway-production"],
            "password": "123-gateway-production"
        }
        payment {
            "db_user":   "payment",
            "db_password": "821462d7-47fb-402c-a22a-a58867602e39"
            "policies": ["payment-production"],
            "password": "123-payment-production"
        }
    }
}

