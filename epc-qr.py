# python3.12 -m pip install py-epc-qr --break-system-packages
# python3.12 epc-qr.py

from py_epc_qr.transaction import consumer_epc_qr

epc_qr = consumer_epc_qr(
    beneficiary="ME",
    iban="DE49123456789123456789",
    amount=10000.00,
    remittance="2024/0001"
)

epc_qr.to_qr()

