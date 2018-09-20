include vendor/yodita/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/yodita/config/BoardConfigQcom.mk
endif

include vendor/yodita/config/BoardConfigSoong.mk
