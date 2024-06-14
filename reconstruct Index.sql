use centegy_sndpro_uet
go

ALTER INDEX [AK_Index_DSR_Report] ON SCHEME_SKU REBUILD WITH (FILLFACTOR = 80)
Print '1' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [AK_Index_Sales_Stock] ON STOCK_BATCH REBUILD WITH (FILLFACTOR = 80)
Print '2' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [AK_SCHEME_DISCOUNT_DOC_DATE] ON SCHEME_DISCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '3' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [AK_SCHEME_SKU_DOC_DATE] ON SCHEME_SKU REBUILD WITH (FILLFACTOR = 80)
Print '4' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [AX_TEMP_POP_STATUS_STATUS_DATE] ON TEMP_POP_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '5' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_CASHMEMO_DETAIL_FCS_IC] ON CASHMEMO_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '6' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_CD_RFT_POP_SALES] ON CASHMEMO_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '7' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_CM_DIFF_CAL] ON CASHMEMO REBUILD WITH (FILLFACTOR = 80)
Print '8' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_CM_RFT_POP] ON CASHMEMO REBUILD WITH (FILLFACTOR = 80)
Print '9' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_CM_RFT_POP_SALES] ON CASHMEMO REBUILD WITH (FILLFACTOR = 80)
Print '10' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_CM_RFT_POP_SALES2] ON CASHMEMO REBUILD WITH (FILLFACTOR = 80)
Print '11' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_DSR_RFT_POP] ON DSR REBUILD WITH (FILLFACTOR = 80)
Print '12' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [idx_IG_I_PromotionControl_PromotionTypeCodeRangeBasis] ON IG_I_PromotionControl REBUILD WITH (FILLFACTOR = 80)
Print '13' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_IQ_PROCESS_FCSPLUS_MKD] ON MIS_KPI_DATA REBUILD WITH (FILLFACTOR = 80)
Print '14' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_IQ_PROCESS_FCSPLUS_SO] ON SUGGESTED_ORDER REBUILD WITH (FILLFACTOR = 80)
Print '15' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [idx_pb_setup_pbs_period_to_PDV1] ON pb_setup REBUILD WITH (FILLFACTOR = 80)
Print '16' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_PD_FCSIC] ON POLICY_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '17' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_POP_RFT_POP_SALES] ON POP REBUILD WITH (FILLFACTOR = 80)
Print '18' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [idx_SKU_SKU_INDEX_4PD] ON SKU REBUILD WITH (FILLFACTOR = 80)
Print '19' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_xdPickListHeader_TD] ON xdPickListHeader REBUILD WITH (FILLFACTOR = 80)
Print '20' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_xdPromotionControlImage_PI] ON xdPromotionControlImage REBUILD WITH (FILLFACTOR = 80)
Print '21' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IDX_xdSalesAnalysis_PrincipleID] ON xdSalesAnalysis REBUILD WITH (FILLFACTOR = 80)
Print '22' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [Index_Claim] ON SCHEME_SKU REBUILD WITH (FILLFACTOR = 80)
Print '23' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [Index_Claim_Claim_No] ON SCHEME_DISCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '24' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [Index_Claim_SD2] ON SCHEME_DISCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '25' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [Index_Claim_SD3] ON SCHEME_DISCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '26' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [index_date] ON SCHEME_DISCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '27' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [index_date] ON SCHEME_SKU REBUILD WITH (FILLFACTOR = 80)
Print '28' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [index_date] ON TRANS_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '29' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [index_TD_DSI] ON TRANS_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '30' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [Index_TD_SKU] ON TRANS_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '31' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IndexProcess_Status] ON IG_O_SalesOrderHeader REBUILD WITH (FILLFACTOR = 80)
Print '32' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX ['ISyncKey'] ON IG_O_SalesOrderHeader REBUILD WITH (FILLFACTOR = 80)
Print '33' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtBusinessTypeParameters] ON RtBusinessTypeParameters REBUILD WITH (FILLFACTOR = 80)
Print '34' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtCouponMaster] ON RtCouponMaster REBUILD WITH (FILLFACTOR = 80)
Print '35' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtCouponQuota] ON RtCouponQuota REBUILD WITH (FILLFACTOR = 80)
Print '36' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtCustomerCouponMapping] ON RtCustomerCouponMapping REBUILD WITH (FILLFACTOR = 80)
Print '37' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtCustomerCouponStatus] ON RtCustomerCouponStatus REBUILD WITH (FILLFACTOR = 80)
Print '38' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtCustomerShipments] ON RtCustomerShipments REBUILD WITH (FILLFACTOR = 80)
Print '39' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtHSNMaster] ON RtHSNMaster REBUILD WITH (FILLFACTOR = 80)
Print '40' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtLocationCategory] ON RtLocationCategory REBUILD WITH (FILLFACTOR = 80)
Print '41' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtMessageTemplate] ON RtMessageTemplate REBUILD WITH (FILLFACTOR = 80)
Print '42' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtPrincipleLogo] ON RtPrincipleLogo REBUILD WITH (FILLFACTOR = 80)
Print '43' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtPromotionAgreement] ON RtPromotionAgreement REBUILD WITH (FILLFACTOR = 80)
Print '44' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtSalesmanCategory] ON RtSalesmanCategory REBUILD WITH (FILLFACTOR = 80)
Print '45' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtServicedByCustomerMapping] ON RtServicedByCustomerMapping REBUILD WITH (FILLFACTOR = 80)
Print '46' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtSMTPMapping] ON RtSMTPMapping REBUILD WITH (FILLFACTOR = 80)
Print '47' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtStateMaster] ON RtStateMaster REBUILD WITH (FILLFACTOR = 80)
Print '48' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtTAXAttribution] ON RtTAXAttribution REBUILD WITH (FILLFACTOR = 80)
Print '49' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_RtTAXType] ON RtTAXType REBUILD WITH (FILLFACTOR = 80)
Print '50' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xdLocationPromotionQuota] ON xdLocationPromotionQuota REBUILD WITH (FILLFACTOR = 80)
Print '51' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xdNormDefinition] ON xdNormDefinition REBUILD WITH (FILLFACTOR = 80)
Print '52' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xdOutletEmptiesTrnHeader] ON xdOutletEmptiesTrnHeader REBUILD WITH (FILLFACTOR = 80)
Print '53' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xdPickListHeader] ON xdPickListHeader REBUILD WITH (FILLFACTOR = 80)
Print '54' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xdProductCategoryImage] ON xdProductCategoryImage REBUILD WITH (FILLFACTOR = 80)
Print '55' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xdProductHierarchyImage] ON xdProductHierarchyImage REBUILD WITH (FILLFACTOR = 80)
Print '56' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xdProductImage] ON xdProductImage REBUILD WITH (FILLFACTOR = 80)
Print '57' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xdPromotionControlImage] ON xdPromotionControlImage REBUILD WITH (FILLFACTOR = 80)
Print '58' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xdSearchBlockMaster] ON xdSearchBlockMaster REBUILD WITH (FILLFACTOR = 80)
Print '59' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xdSearchTagMaster] ON xdSearchTagMaster REBUILD WITH (FILLFACTOR = 80)
Print '60' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xdUOM] ON xdUOM REBUILD WITH (FILLFACTOR = 80)
Print '61' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xoCustomerFavourites] ON xoCustomerFavourites REBUILD WITH (FILLFACTOR = 80)
Print '62' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xoGiftMaster] ON xoGiftMaster REBUILD WITH (FILLFACTOR = 80)
Print '63' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xoHeldOrder] ON xoHeldOrder REBUILD WITH (FILLFACTOR = 80)
Print '64' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xoRouteBook] ON xoRouteBook REBUILD WITH (FILLFACTOR = 80)
Print '65' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xoRouteBook_TCPM] ON xoRouteBook REBUILD WITH (FILLFACTOR = 80)
Print '66' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xoRouteBookCID] ON xoRouteBook REBUILD WITH (FILLFACTOR = 80)
Print '67' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xoRouteBookMOC] ON xoRouteBook REBUILD WITH (FILLFACTOR = 80)
Print '68' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xoRouteBookPHC] ON xoRouteBook REBUILD WITH (FILLFACTOR = 80)
Print '69' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [IX_xoSignedAgreement] ON xoSignedAgreement REBUILD WITH (FILLFACTOR = 80)
Print '70' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [OutBox_PK] ON MBZ_OutBox REBUILD WITH (FILLFACTOR = 80)
Print '71' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_[RELEASE_DETAILS] ON RELEASE_DETAILS REBUILD WITH (FILLFACTOR = 80)
Print '72' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__AC_GL_FD__50E8E33937026115] ON AC_GL_FD_FINANCIALDOCMAPPING REBUILD WITH (FILLFACTOR = 80)
Print '73' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__APPROVER__094CCA4FFD6175E4] ON APPROVER_USER_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '74' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__Bck_IG_O__33A8519A31DD5893] ON Bck_IG_O_NewCustomer REBUILD WITH (FILLFACTOR = 80)
Print '75' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__Bck_IG_O__4631682BE341D492] ON Bck_IG_O_UploadSyncKeys REBUILD WITH (FILLFACTOR = 80)
Print '76' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__Bck_IG_O__7EC4C7A31DE1AD90] ON Bck_IG_O_CollectionHeader REBUILD WITH (FILLFACTOR = 80)
Print '77' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__Bck_IG_O__85931D0F871BDF64] ON Bck_IG_O_CustomerGeoCode REBUILD WITH (FILLFACTOR = 80)
Print '78' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__Bck_IG_O__8CB7F3541B0540E5] ON Bck_IG_O_LoadRequestDetail REBUILD WITH (FILLFACTOR = 80)
Print '79' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__Bck_IG_O__9E431061C55520F6] ON Bck_IG_O_VisitSummary REBUILD WITH (FILLFACTOR = 80)
Print '80' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__DAYEND_L__BE1F409F1CF8764F] ON DAYEND_LOG REBUILD WITH (FILLFACTOR = 80)
Print '81' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__DISTRIBU__967F62D93914C6B9] ON DISTRIBUTOR_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '82' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__MBZ_ALERTS__2610A626] ON MBZ_ALERTS REBUILD WITH (FILLFACTOR = 80)
Print '83' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__MBZ_EVENT__2EA5EC27] ON MBZ_EVENT REBUILD WITH (FILLFACTOR = 80)
Print '84' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__MBZ_EVENTPARAM__318258D2] ON MBZ_EVENTPARAM REBUILD WITH (FILLFACTOR = 80)
Print '85' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__MBZ_Logg__3214EC2712CFED97] ON MBZ_Logger REBUILD WITH (FILLFACTOR = 80)
Print '86' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__MBZ_LOOK__97ED791D51C14449] ON MBZ_LOOKUPSPARAM REBUILD WITH (FILLFACTOR = 80)
Print '87' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__MBZ_LOOK__FE0CB7DC66ED72A6] ON MBZ_LOOKUPS REBUILD WITH (FILLFACTOR = 80)
Print '88' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__MBZ_Mess__C87C037C324898F0] ON MBZ_MessageLog REBUILD WITH (FILLFACTOR = 80)
Print '89' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__MBZ_PARA__DB0C5B2122123127] ON MBZ_PARAMSREPSTRY REBUILD WITH (FILLFACTOR = 80)
Print '90' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__MBZ_TEMP__EE9F4DFA4A202281] ON MBZ_TEMPLATEPARAM REBUILD WITH (FILLFACTOR = 80)
Print '91' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__MBZ_TEMPLATE__336AA144] ON MBZ_TEMPLATE REBUILD WITH (FILLFACTOR = 80)
Print '92' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__PR_GL_CM_CAACNTM__4934893B] ON PR_GL_CM_CAACNTMIS REBUILD WITH (FILLFACTOR = 80)
Print '93' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__PR_GN_AM_ACNTMIS__6FC2AFC9] ON PR_GN_AM_ACNTMIS REBUILD WITH (FILLFACTOR = 80)
Print '94' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__Temp_Col__04B92F3D69ED083E] ON Temp_Column_Update REBUILD WITH (FILLFACTOR = 80)
Print '95' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK__Temp_con__4B6B22A2661C775A] ON Temp_constraint REBUILD WITH (FILLFACTOR = 80)
Print '96' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_CP_CHEQPRINT] ON AC_GL_CP_CHEQPRINT REBUILD WITH (FILLFACTOR = 80)
Print '97' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_KO_RCPYKNOCKOFF] ON AC_GL_KO_RCPYKNOCKOFF REBUILD WITH (FILLFACTOR = 80)
Print '98' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_MR_MASTER] ON AC_GL_MR_MASTER REBUILD WITH (FILLFACTOR = 80)
Print '99' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_PA_PRRGLMAPPING] ON AC_GL_PA_PRRGLMAPPING REBUILD WITH (FILLFACTOR = 80)
Print '100' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_PD_RCPPYMDETAIL] ON AC_GL_PD_RCPPYMDETAIL REBUILD WITH (FILLFACTOR = 80)
Print '101' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_PM_RCPPYMMASTER] ON AC_GL_PM_RCPPYMMASTER REBUILD WITH (FILLFACTOR = 80)
Print '102' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_PU_PRFCUSERMAPPING] ON AC_GL_PU_PRFCUSERMAPPING REBUILD WITH (FILLFACTOR = 80)
Print '103' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_RD_RECURRINGDTL] ON AC_GL_RD_RECURRINGDTL REBUILD WITH (FILLFACTOR = 80)
Print '104' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_RH_RECURRINGHD] ON AC_GL_RH_RECURRINGHD REBUILD WITH (FILLFACTOR = 80)
Print '105' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_RS_RECURRINGSDTL] ON AC_GL_RS_RECURRINGSDTL REBUILD WITH (FILLFACTOR = 80)
Print '106' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_SB_SUBDETAIL] ON AC_GL_SB_SUBDETAIL REBUILD WITH (FILLFACTOR = 80)
Print '107' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_SL_SUBLEDGER] ON AC_GL_SL_SUBLEDGER REBUILD WITH (FILLFACTOR = 80)
Print '108' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_SM_SUBMASTER] ON AC_GL_SM_SUBMASTER REBUILD WITH (FILLFACTOR = 80)
Print '109' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_SV_SLTYPEVCHTYPEMAPPING] ON AC_GL_SV_SLTYPEVCHTYPEMAPPING REBUILD WITH (FILLFACTOR = 80)
Print '110' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_VD_VCHDETAIL] ON AC_GL_VD_VCHDETAIL REBUILD WITH (FILLFACTOR = 80)
Print '111' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_VH_VOUCHER] ON AC_GL_VH_VOUCHER REBUILD WITH (FILLFACTOR = 80)
Print '112' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AC_GL_VU_VCHTYPEUSERMAPPING] ON AC_GL_VU_VCHTYPEUSERMAPPING REBUILD WITH (FILLFACTOR = 80)
Print '113' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ACCH_ChartOfAccount] ON ACCH_ChartOfAccount REBUILD WITH (FILLFACTOR = 80)
Print '114' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ACCH_COALevel] ON ACCH_COALevel REBUILD WITH (FILLFACTOR = 80)
Print '115' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ACCH_SQL_STATEMENT] ON ACCH_SQL_STATEMENT REBUILD WITH (FILLFACTOR = 80)
Print '116' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ACCH_Transaction] ON ACCH_Transaction REBUILD WITH (FILLFACTOR = 80)
Print '117' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ACCOUNT_GROUP] ON ACCOUNT_GROUP REBUILD WITH (FILLFACTOR = 80)
Print '118' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ACCOUNT_TYPE] ON ACCOUNT_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '119' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Accounts] ON MBZ_Accounts REBUILD WITH (FILLFACTOR = 80)
Print '120' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Activity_Detail] ON Activity_Detail REBUILD WITH (FILLFACTOR = 80)
Print '121' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Activity_Head] ON Activity_Head REBUILD WITH (FILLFACTOR = 80)
Print '122' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Activity_Transaction] ON Activity_Transaction REBUILD WITH (FILLFACTOR = 80)
Print '123' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ADDITIONAL_FIELD_SETUP] ON ADDITIONAL_FIELD_SETUP REBUILD WITH (FILLFACTOR = 80)
Print '124' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ALLOCATED_STOCK] ON ALLOCATED_STOCK REBUILD WITH (FILLFACTOR = 80)
Print '125' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ALLOWANCE_DEDUCTION] ON ALLOWANCE_DEDUCTION REBUILD WITH (FILLFACTOR = 80)
Print '126' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ALLOWANCE_DEDUCTION_DETAIL] ON ALLOWANCE_DEDUCTION_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '127' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APP_LOGGER] ON APP_LOGGER REBUILD WITH (FILLFACTOR = 80)
Print '128' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APP_TABLE] ON APP_TABLE REBUILD WITH (FILLFACTOR = 80)
Print '129' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APP_VIEW] ON APP_VIEW REBUILD WITH (FILLFACTOR = 80)
Print '130' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APP_VIEW_CHILD_SCREEN] ON APP_VIEW_CHILD_SCREEN REBUILD WITH (FILLFACTOR = 80)
Print '131' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APP_VIEW_COLUMN] ON APP_VIEW_COLUMN REBUILD WITH (FILLFACTOR = 80)
Print '132' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APP_VIEW_ORDERING] ON APP_VIEW_ORDERING REBUILD WITH (FILLFACTOR = 80)
Print '133' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APPLICATION_DEPLOYMENT_LOG] ON APPLICATION_DEPLOYMENT_LOG REBUILD WITH (FILLFACTOR = 80)
Print '134' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APPLICATION_NOTIFICATION] ON APPLICATION_NOTIFICATION REBUILD WITH (FILLFACTOR = 80)
Print '135' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APPLICATION_SETUP] ON APPLICATION_SETUP REBUILD WITH (FILLFACTOR = 80)
Print '136' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APPLICATIONS] ON APPLICATIONS REBUILD WITH (FILLFACTOR = 80)
Print '137' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APPROVAL_STATUS] ON APPROVAL_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '138' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_APPROVE_LOG] ON APPROVE_LOG REBUILD WITH (FILLFACTOR = 80)
Print '139' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AREA_TYPE] ON AREA_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '140' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Asset] ON Asset REBUILD WITH (FILLFACTOR = 80)
Print '141' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_BRAND] ON ASSET_BRAND REBUILD WITH (FILLFACTOR = 80)
Print '142' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_CENSUS] ON ASSET_CENSUS REBUILD WITH (FILLFACTOR = 80)
Print '143' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_CENSUS_TYPE] ON ASSET_CENSUS_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '144' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_MODEL] ON ASSET_MODEL REBUILD WITH (FILLFACTOR = 80)
Print '145' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_OPERATION_STATUS] ON ASSET_OPERATION_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '146' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_PAYMENT] ON ASSET_PAYMENT REBUILD WITH (FILLFACTOR = 80)
Print '147' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_QUOTA] ON ASSET_QUOTA REBUILD WITH (FILLFACTOR = 80)
Print '148' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_QUOTA_TYPE] ON ASSET_QUOTA_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '149' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_SERVICE] ON ASSET_SERVICE REBUILD WITH (FILLFACTOR = 80)
Print '150' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_SERVICE_PLAN] ON ASSET_SERVICE_PLAN REBUILD WITH (FILLFACTOR = 80)
Print '151' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_SIZE] ON ASSET_SIZE REBUILD WITH (FILLFACTOR = 80)
Print '152' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSET_TRACKING_STATUS] ON ASSET_TRACKING_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '153' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AssetBarCode] ON AssetBarCode REBUILD WITH (FILLFACTOR = 80)
Print '154' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AssetCategory] ON AssetCategory REBUILD WITH (FILLFACTOR = 80)
Print '155' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AssetComplaint] ON AssetComplaint REBUILD WITH (FILLFACTOR = 80)
Print '156' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AssetPart] ON AssetPart REBUILD WITH (FILLFACTOR = 80)
Print '157' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AssetRank] ON AssetRank REBUILD WITH (FILLFACTOR = 80)
Print '158' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ASSETREPAIR] ON ASSETREPAIR REBUILD WITH (FILLFACTOR = 80)
Print '159' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AssetStatus] ON AssetStatus REBUILD WITH (FILLFACTOR = 80)
Print '160' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AssetStatusHistory] ON AssetStatusHistory REBUILD WITH (FILLFACTOR = 80)
Print '161' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AssetTransaction] ON AssetTransaction REBUILD WITH (FILLFACTOR = 80)
Print '162' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AssetTransactonReason] ON AssetTransactonReason REBUILD WITH (FILLFACTOR = 80)
Print '163' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AssetType] ON AssetType REBUILD WITH (FILLFACTOR = 80)
Print '164' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AVAIL_TYPE] ON AVAIL_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '165' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_AVLVSL_DETAIL] ON AVLVSL_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '166' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Backup_log] ON Backup_log REBUILD WITH (FILLFACTOR = 80)
Print '167' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BANK] ON BANK REBUILD WITH (FILLFACTOR = 80)
Print '168' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BATCH] ON BATCH REBUILD WITH (FILLFACTOR = 80)
Print '169' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BATCH_GROUP] ON BATCH_GROUP REBUILD WITH (FILLFACTOR = 80)
Print '170' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BATCH_JOB_DETAIL] ON BATCH_JOB_LOG REBUILD WITH (FILLFACTOR = 80)
Print '171' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BATCH_LOGGER] ON BATCH_LOGGER REBUILD WITH (FILLFACTOR = 80)
Print '172' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BATCH_SCHEDULE] ON BATCH_SCHEDULE REBUILD WITH (FILLFACTOR = 80)
Print '173' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BATCH_TASK] ON BATCH_TASK REBUILD WITH (FILLFACTOR = 80)
Print '174' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BILLING_STATUS] ON BILLING_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '175' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BR_AC_ACTION] ON BR_AC_ACTION REBUILD WITH (FILLFACTOR = 80)
Print '176' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BR_ER_ENTITY_RULES] ON BR_ER_ENTITY_RULES REBUILD WITH (FILLFACTOR = 80)
Print '177' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BR_EV_EVENT] ON BR_EV_EVENT REBUILD WITH (FILLFACTOR = 80)
Print '178' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BR_RU_RULE] ON BR_RU_RULE REBUILD WITH (FILLFACTOR = 80)
Print '179' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BRANCH] ON BRANCH REBUILD WITH (FILLFACTOR = 80)
Print '180' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BrandTarget] ON BrandTarget REBUILD WITH (FILLFACTOR = 80)
Print '181' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BrandTarget_Brand] ON BrandTarget_Brand REBUILD WITH (FILLFACTOR = 80)
Print '182' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_BrandValueVolume] ON BrandValueVolume REBUILD WITH (FILLFACTOR = 80)
Print '183' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CABIN] ON CABIN REBUILD WITH (FILLFACTOR = 80)
Print '184' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CABIN_PRODUCT] ON CABIN_PRODUCT REBUILD WITH (FILLFACTOR = 80)
Print '185' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CALENDAR] ON CALENDAR REBUILD WITH (FILLFACTOR = 80)
Print '186' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CASHMEMO] ON CASHMEMO REBUILD WITH (FILLFACTOR = 80)
Print '187' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CASHMEMO_DETAIL] ON CASHMEMO_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '188' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CASHMEMO_DETAIL_SR] ON CASHMEMO_DETAIL_SR REBUILD WITH (FILLFACTOR = 80)
Print '189' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CASHMEMO_SKU_REPLACE] ON CASHMEMO_SKU_REPLACE REBUILD WITH (FILLFACTOR = 80)
Print '190' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CASHMEMO_SR] ON CASHMEMO_SR REBUILD WITH (FILLFACTOR = 80)
Print '191' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CASHMEMO_TYPE] ON CASHMEMO_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '192' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CATEGORY] ON CATEGORY REBUILD WITH (FILLFACTOR = 80)
Print '193' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Category_Distribution] ON Category_Distribution REBUILD WITH (FILLFACTOR = 80)
Print '194' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CHANNEL] ON CHANNEL REBUILD WITH (FILLFACTOR = 80)
Print '195' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CHANNEL_LEVEL_SETUP] ON CHANNEL_LEVEL_SETUP REBUILD WITH (FILLFACTOR = 80)
Print '196' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CHEQUE_DETAIL] ON CHEQUE_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '197' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CHEQUE_STATUS] ON CHEQUE_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '198' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Child_Screen] ON Child_Screen REBUILD WITH (FILLFACTOR = 80)
Print '199' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Child_Screen_Desig] ON Child_Screen_Desig REBUILD WITH (FILLFACTOR = 80)
Print '200' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CLAIM_BAD] ON CLAIM_BAD REBUILD WITH (FILLFACTOR = 80)
Print '201' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Claim_Compile] ON Claim_Compile REBUILD WITH (FILLFACTOR = 80)
Print '202' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CLAIM_DETAIL] ON CLAIM_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '203' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CLAIM_DOCUMENT_DETAIL] ON CLAIM_DOCUMENT_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '204' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CLAIM_HEAD] ON CLAIM_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '205' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CLAIM_SUB_TYPE] ON CLAIM_SUB_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '206' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Claim_Type] ON Claim_Type REBUILD WITH (FILLFACTOR = 80)
Print '207' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CLASSIFICATION] ON CLASSIFICATION REBUILD WITH (FILLFACTOR = 80)
Print '208' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CM_PRINT_PARAMETER] ON CM_PRINT_PARAMETER REBUILD WITH (FILLFACTOR = 80)
Print '209' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_GEO_MAPPING] ON COMP_GEO_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '210' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_LEVEL_SETUP] ON COMP_LEVEL_SETUP REBUILD WITH (FILLFACTOR = 80)
Print '211' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_LEVEL1] ON COMP_LEVEL1 REBUILD WITH (FILLFACTOR = 80)
Print '212' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_LEVEL2] ON COMP_LEVEL2 REBUILD WITH (FILLFACTOR = 80)
Print '213' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_LEVEL3] ON COMP_LEVEL3 REBUILD WITH (FILLFACTOR = 80)
Print '214' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_LEVEL4] ON COMP_LEVEL4 REBUILD WITH (FILLFACTOR = 80)
Print '215' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_LEVEL5] ON COMP_LEVEL5 REBUILD WITH (FILLFACTOR = 80)
Print '216' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_LEVEL6] ON COMP_LEVEL6 REBUILD WITH (FILLFACTOR = 80)
Print '217' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_LEVEL7] ON COMP_LEVEL7 REBUILD WITH (FILLFACTOR = 80)
Print '218' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_LEVEL8] ON COMP_LEVEL8 REBUILD WITH (FILLFACTOR = 80)
Print '219' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_LEVEL9] ON COMP_LEVEL9 REBUILD WITH (FILLFACTOR = 80)
Print '220' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_PROD_MAPPING] ON COMP_PROD_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '221' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMP_TABLE] ON COMP_TABLE REBUILD WITH (FILLFACTOR = 80)
Print '222' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMPANY] ON COMPANY REBUILD WITH (FILLFACTOR = 80)
Print '223' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Company_Message] ON Company_Message REBUILD WITH (FILLFACTOR = 80)
Print '224' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMPANY_PRICE_STRUCTURE] ON COMPANY_PRICE_STRUCTURE REBUILD WITH (FILLFACTOR = 80)
Print '225' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMPANY_RANK] ON COMPANY_RANK REBUILD WITH (FILLFACTOR = 80)
Print '226' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CompanyWareHouse] ON CompanyWareHouse REBUILD WITH (FILLFACTOR = 80)
Print '227' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMPETITOR] ON COMPETITOR REBUILD WITH (FILLFACTOR = 80)
Print '228' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMPETITOR_DETAIL] ON COMPETITOR_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '229' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_COMPETITOR_PRODUCTS] ON COMPETITOR_PRODUCTS REBUILD WITH (FILLFACTOR = 80)
Print '230' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ComplaintStatus] ON ComplaintStatus REBUILD WITH (FILLFACTOR = 80)
Print '231' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ComplaintType] ON ComplaintType REBUILD WITH (FILLFACTOR = 80)
Print '232' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Contacts_1] ON MBZ_Contacts REBUILD WITH (FILLFACTOR = 80)
Print '233' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CONTAINER] ON CONTAINER REBUILD WITH (FILLFACTOR = 80)
Print '234' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CONTRACT_DETAIL] ON CONTRACT_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '235' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CONTRACT_HEAD] ON CONTRACT_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '236' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CONTRACT_RANGE] ON CONTRACT_RANGE REBUILD WITH (FILLFACTOR = 80)
Print '237' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CONTROL_CONTAINER] ON CONTROL_CONTAINER REBUILD WITH (FILLFACTOR = 80)
Print '238' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CONTROL_NON_CONTAINER] ON CONTROL_NON_CONTAINER REBUILD WITH (FILLFACTOR = 80)
Print '239' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CONVERSION_STATUS] ON CONVERSION_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '240' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CROP] ON CROP REBUILD WITH (FILLFACTOR = 80)
Print '241' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CSD_STATUS] ON CSD_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '242' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_CUSTOMERHIERARCHY] ON CUSTOMERHIERARCHY REBUILD WITH (FILLFACTOR = 80)
Print '243' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DA_HEAD] ON DA_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '244' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DATABASE_RESTORE] ON DATABASE_RESTORE REBUILD WITH (FILLFACTOR = 80)
Print '245' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DEPOSIT_SLIP] ON DEPOSIT_SLIP REBUILD WITH (FILLFACTOR = 80)
Print '246' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DEPOSIT_SLIP_DETAIL] ON DEPOSIT_SLIP_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '247' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DEPOSIT_SLIP_VOUCHERMAPPING] ON DEPOSIT_SLIP_VOUCHERMAPPING REBUILD WITH (FILLFACTOR = 80)
Print '248' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DESCRIPTION_DETAIL] ON DESCRIPTION_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '249' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DESCRIPTION_HEAD] ON DESCRIPTION_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '250' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DESIG_AUTHORITY] ON DESIG_AUTHORITY REBUILD WITH (FILLFACTOR = 80)
Print '251' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DESIG_LIMIT] ON DESIG_LIMIT REBUILD WITH (FILLFACTOR = 80)
Print '252' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DESIGNATION] ON DESIGNATION REBUILD WITH (FILLFACTOR = 80)
Print '253' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DEVICE_HOMESCREEN] ON DEVICE_HOME_SCREEN REBUILD WITH (FILLFACTOR = 80)
Print '254' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DFT_REPORT_FIELDS_TRANSLATION] ON DFT_REPORT_FIELDS_TRANSLATION REBUILD WITH (FILLFACTOR = 80)
Print '255' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISCOUNT_TYPE] ON DISCOUNT_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '256' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTION_TYPE] ON DISTRIBUTION_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '257' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR] ON DISTRIBUTOR REBUILD WITH (FILLFACTOR = 80)
Print '258' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_ASSOCIATION] ON DISTRIBUTOR_ASSOCIATION REBUILD WITH (FILLFACTOR = 80)
Print '259' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_CO] ON DISTRIBUTOR_CO REBUILD WITH (FILLFACTOR = 80)
Print '260' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_CONTACT] ON DISTRIBUTOR_CONTACT REBUILD WITH (FILLFACTOR = 80)
Print '261' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_DISTRICT] ON DISTRIBUTOR_DISTRICT REBUILD WITH (FILLFACTOR = 80)
Print '262' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_GeoBoundry_Mapping] ON DISTRIBUTOR_GeoBoundry_Mapping REBUILD WITH (FILLFACTOR = 80)
Print '263' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_GROUP] ON DISTRIBUTOR_GROUP REBUILD WITH (FILLFACTOR = 80)
Print '264' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_PARTNER] ON DISTRIBUTOR_PARTNER REBUILD WITH (FILLFACTOR = 80)
Print '265' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_POP_MAPPING] ON DISTRIBUTOR_POP_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '266' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Distributor_Productivity_Benchmarks] ON Distributor_Productivity_Benchmarks REBUILD WITH (FILLFACTOR = 80)
Print '267' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_RA_MAPPING] ON DISTRIBUTOR_RA_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '268' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_SERVINGTOWN] ON DISTRIBUTOR_SERVINGTOWN REBUILD WITH (FILLFACTOR = 80)
Print '269' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_SKUQTY] ON DISTRIBUTOR_SKUQTY REBUILD WITH (FILLFACTOR = 80)
Print '270' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_TAX] ON DISTRIBUTOR_TAX REBUILD WITH (FILLFACTOR = 80)
Print '271' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRIBUTOR_VISITTYPE] ON DISTRIBUTOR_VISITTYPE REBUILD WITH (FILLFACTOR = 80)
Print '272' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DistributorAppPath] ON DistributorAppPath REBUILD WITH (FILLFACTOR = 80)
Print '273' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DistributorTextFile] ON DistributorTextFile REBUILD WITH (FILLFACTOR = 80)
Print '274' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DISTRICT] ON DISTRICT REBUILD WITH (FILLFACTOR = 80)
Print '275' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DOC_TYPE] ON DOC_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '276' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DocType_GroupCode] ON DocType_GroupCode REBUILD WITH (FILLFACTOR = 80)
Print '277' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DOCUMENT] ON DOCUMENT REBUILD WITH (FILLFACTOR = 80)
Print '278' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DOCUMENT_COUNT] ON DOCUMENT_COUNT REBUILD WITH (FILLFACTOR = 80)
Print '279' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DOCUMENT_DIFF] ON DOCUMENT_DIFF REBUILD WITH (FILLFACTOR = 80)
Print '280' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DOCUMENT_REFERENCE] ON DOCUMENT_REFERENCE REBUILD WITH (FILLFACTOR = 80)
Print '281' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DOCUMENT_TAX_DETAIL] ON DOCUMENT_TAX_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '282' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DOCUMENT_TAX_HEAD] ON DOCUMENT_TAX_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '283' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DSR] ON DSR REBUILD WITH (FILLFACTOR = 80)
Print '284' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DSR_ADJUSTMENT] ON DSR_ADJUSTMENT REBUILD WITH (FILLFACTOR = 80)
Print '285' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DSR_ADJUSTMENT_DETAIL] ON DSR_ADJUSTMENT_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '286' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DSR_GPS_TRACK] ON DSR_GPS_TRACK REBUILD WITH (FILLFACTOR = 80)
Print '287' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DSR_MANAGER] ON DSR_MANAGER REBUILD WITH (FILLFACTOR = 80)
Print '288' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DSR_Productivity_Benchmarks] ON DSR_Productivity_Benchmarks REBUILD WITH (FILLFACTOR = 80)
Print '289' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DSR_REQUISITION] ON DSR_REQUISITION REBUILD WITH (FILLFACTOR = 80)
Print '290' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DSR_REQUISITION_DETAIL] ON DSR_REQUISITION_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '291' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DSR_Temp] ON DSR_Temp REBUILD WITH (FILLFACTOR = 80)
Print '292' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_dtproperties] ON dtproperties REBUILD WITH (FILLFACTOR = 80)
Print '293' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_DYNAMIC_DATA] ON DYNAMIC_DATA REBUILD WITH (FILLFACTOR = 80)
Print '294' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ELEMENT] ON ELEMENT REBUILD WITH (FILLFACTOR = 80)
Print '295' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EMAIL_TEMPLATE] ON EMAIL_TEMPLATE REBUILD WITH (FILLFACTOR = 80)
Print '296' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EMP_ALL_DED_DETAIL] ON EMP_ALL_DED_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '297' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EMPLOYEE] ON EMPLOYEE REBUILD WITH (FILLFACTOR = 80)
Print '298' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EMPLOYEE_ALLOWANCE_DEDUCTION] ON EMPLOYEE_ALLOWANCE_DEDUCTION REBUILD WITH (FILLFACTOR = 80)
Print '299' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EMPLOYEE_ATTENDANCE] ON EMPLOYEE_ATTENDANCE REBUILD WITH (FILLFACTOR = 80)
Print '300' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EMPLOYEE_EDUCATION] ON EMPLOYEE_EDUCATION REBUILD WITH (FILLFACTOR = 80)
Print '301' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Employee_EOJ_Reason] ON Employee_EOJ_Reason REBUILD WITH (FILLFACTOR = 80)
Print '302' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EMPLOYEE_EXPERIENCE] ON EMPLOYEE_EXPERIENCE REBUILD WITH (FILLFACTOR = 80)
Print '303' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EMPLOYEE_INCENTIVE] ON EMPLOYEE_INCENTIVE REBUILD WITH (FILLFACTOR = 80)
Print '304' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EMPLOYEE_SALARY] ON EMPLOYEE_SALARY REBUILD WITH (FILLFACTOR = 80)
Print '305' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EMPLOYEE_STATUS] ON EMPLOYEE_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '306' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ENTRY_SKU_TYPE_MAPPING] ON ENTRY_SKU_TYPE_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '307' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ER_MS_GT_GENERALTRANSACTION] ON ER_MS_GT_GENERALTRANSACTION REBUILD WITH (FILLFACTOR = 80)
Print '308' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EV_EVOUCHER_ALLOCATION] ON EV_EVOUCHER_ALLOCATION REBUILD WITH (FILLFACTOR = 80)
Print '309' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EV_EVOUCHER_CATEGORY] ON EV_EVOUCHER_CATEGORY REBUILD WITH (FILLFACTOR = 80)
Print '310' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EV_EVOUCHER_MASTER] ON EV_EVOUCHER_MASTER REBUILD WITH (FILLFACTOR = 80)
Print '311' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_EVOUCHER_PARTICIPANT_POP] ON EV_EVOUCHER_POP REBUILD WITH (FILLFACTOR = 80)
Print '312' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Expense_Detail] ON Expense_Detail REBUILD WITH (FILLFACTOR = 80)
Print '313' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Expense_Type] ON Expense_Type REBUILD WITH (FILLFACTOR = 80)
Print '314' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FAST_CASHMEMO] ON FAST_CASHMEMO REBUILD WITH (FILLFACTOR = 80)
Print '315' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FAST_ENTRY_OPTION] ON FAST_ENTRY_OPTION REBUILD WITH (FILLFACTOR = 80)
Print '316' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FCS_LPPC_BENCHMARK] ON FCS_LPPC_BENCHMARK REBUILD WITH (FILLFACTOR = 80)
Print '317' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FCS_SUB_ELEMENT_TARGET] ON FCS_SUB_ELEMENT_TARGET REBUILD WITH (FILLFACTOR = 80)
Print '318' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FCS_SUMMARY_DATA] ON FCS_SUMMARY_DATA REBUILD WITH (FILLFACTOR = 80)
Print '319' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FCS_SUMMARY_DSR_DATA] ON FCS_SUMMARY_DSR_DATA REBUILD WITH (FILLFACTOR = 80)
Print '320' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FCS_SUMMARY_DSR_SC_DATA] ON FCS_SUMMARY_DSR_SC_DATA REBUILD WITH (FILLFACTOR = 80)
Print '321' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FCS_SUMMARY_DSR_SE_DATA] ON FCS_SUMMARY_DSR_SE_DATA REBUILD WITH (FILLFACTOR = 80)
Print '322' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FCS_SUMMARY_SE_DATA] ON FCS_SUMMARY_SE_DATA REBUILD WITH (FILLFACTOR = 80)
Print '323' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FIELD_CATEGORY_MAPPING] ON FIELD_CATEGORY_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '324' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FIELD_COMB] ON FIELD_COMB REBUILD WITH (FILLFACTOR = 80)
Print '325' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FIELD_CONTROL] ON FIELD_CONTROL REBUILD WITH (FILLFACTOR = 80)
Print '326' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FIELD_FORMAT] ON FIELD_FORMAT REBUILD WITH (FILLFACTOR = 80)
Print '327' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FIELD_GROUP] ON FIELD_GROUP REBUILD WITH (FILLFACTOR = 80)
Print '328' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FIELD_GROUP_PROPERTY] ON FIELD_GROUP_PROPERTY REBUILD WITH (FILLFACTOR = 80)
Print '329' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FIELD_HIERARCHY] ON FIELD_HIERARCHY REBUILD WITH (FILLFACTOR = 80)
Print '330' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FIELD_NATURE] ON FIELD_NATURE REBUILD WITH (FILLFACTOR = 80)
Print '331' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FILECONFIG] ON FILECONFIG REBUILD WITH (FILLFACTOR = 80)
Print '332' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FIN_SUBLEDGER] ON FIN_SUBLEDGER REBUILD WITH (FILLFACTOR = 80)
Print '333' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_focusedpjp] ON focusedpjp REBUILD WITH (FILLFACTOR = 80)
Print '334' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FOCUSSEDSKU] ON FOCUSSEDSKU REBUILD WITH (FILLFACTOR = 80)
Print '335' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FUEL_RECEIPT] ON FUEL_RECEIPT REBUILD WITH (FILLFACTOR = 80)
Print '336' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_FUEL_TYPE] ON FUEL_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '337' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GADGET] ON GADGET REBUILD WITH (FILLFACTOR = 80)
Print '338' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GADGET_DETAIL] ON GADGET_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '339' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GADGET_POP_STATUS] ON GADGET_POP_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '340' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GADGET_TRANSACTION] ON GADGET_TRANSACTION REBUILD WITH (FILLFACTOR = 80)
Print '341' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GADGET_TYPE] ON GADGET_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '342' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GENERAL_PARAMETERS] ON GENERAL_PARAMETERS REBUILD WITH (FILLFACTOR = 80)
Print '343' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_BOUNDRY] ON GEO_BOUNDRY REBUILD WITH (FILLFACTOR = 80)
Print '344' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_LEVEL_SETUP] ON GEO_LEVEL_SETUP REBUILD WITH (FILLFACTOR = 80)
Print '345' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_LEVEL1] ON GEO_LEVEL1 REBUILD WITH (FILLFACTOR = 80)
Print '346' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_LEVEL2] ON GEO_LEVEL2 REBUILD WITH (FILLFACTOR = 80)
Print '347' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_LEVEL3] ON GEO_LEVEL3 REBUILD WITH (FILLFACTOR = 80)
Print '348' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_LEVEL4] ON GEO_LEVEL4 REBUILD WITH (FILLFACTOR = 80)
Print '349' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_LEVEL5] ON GEO_LEVEL5 REBUILD WITH (FILLFACTOR = 80)
Print '350' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_LEVEL6] ON GEO_LEVEL6 REBUILD WITH (FILLFACTOR = 80)
Print '351' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_LEVEL7] ON GEO_LEVEL7 REBUILD WITH (FILLFACTOR = 80)
Print '352' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_LEVEL8] ON GEO_LEVEL8 REBUILD WITH (FILLFACTOR = 80)
Print '353' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_LEVEL9] ON GEO_LEVEL9 REBUILD WITH (FILLFACTOR = 80)
Print '354' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEO_TABLE] ON GEO_TABLE REBUILD WITH (FILLFACTOR = 80)
Print '355' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GEOBOUNDRY_COMPLEVEL_MAPPING] ON GEOBOUNDRY_COMPLEVEL_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '356' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GIN_DETAIL] ON GIN_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '357' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GIN_HEAD] ON GIN_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '358' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GRN_DISCOUNT] ON GRN_DISCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '359' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GRN_HEAD] ON GRN_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '360' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GRN_SKU] ON GRN_SKU REBUILD WITH (FILLFACTOR = 80)
Print '361' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Group_Contact_Relations] ON MBZ_Group_Contact_Relations REBUILD WITH (FILLFACTOR = 80)
Print '362' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_GROUP_DATE] ON QS_GROUP_DATE_ENTRY REBUILD WITH (FILLFACTOR = 80)
Print '363' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Groups_1] ON MBZ_Groups REBUILD WITH (FILLFACTOR = 80)
Print '364' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_HHT_PARADETAIL] ON HHT_PARAM_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '365' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_HHT_PARAMASTER] ON HHT_PARAM_MASTER REBUILD WITH (FILLFACTOR = 80)
Print '366' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_BATCH] ON IG_BATCH REBUILD WITH (FILLFACTOR = 80)
Print '367' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_BATCH_DETAIL] ON IG_BATCH_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '368' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_CM_ReEvaluateLog_1] ON IG_CM_ReEvaluateLog REBUILD WITH (FILLFACTOR = 80)
Print '369' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_CONFIGURATION] ON IG_CONFIGURATION REBUILD WITH (FILLFACTOR = 80)
Print '370' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_EXECUTION_LOG] ON IG_EXECUTION_LOG REBUILD WITH (FILLFACTOR = 80)
Print '371' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_AssetDetails] ON IG_I_AssetDetails REBUILD WITH (FILLFACTOR = 80)
Print '372' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_AuthorizedItemDetail] ON IG_I_AuthorizedItemDetail REBUILD WITH (FILLFACTOR = 80)
Print '373' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_CreditDetails] ON IG_I_CreditDetails REBUILD WITH (FILLFACTOR = 80)
Print '374' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_CustomerAttribute] ON IG_I_CustomerAttribute REBUILD WITH (FILLFACTOR = 80)
Print '375' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_CustomerCategory] ON IG_I_CustomerCategory REBUILD WITH (FILLFACTOR = 80)
Print '376' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_CustomerHierarchyV1] ON IG_I_CustomerHierarchyV1 REBUILD WITH (FILLFACTOR = 80)
Print '377' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_CustomerInfo] ON IG_I_CustomerInfo REBUILD WITH (FILLFACTOR = 80)
Print '378' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_CUSTOMERTARGET_1] ON IG_I_CUSTOMERTARGET REBUILD WITH (FILLFACTOR = 80)
Print '379' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_CUSTOMERTARGET_v1] ON IG_I_CUSTOMERTARGETV1 REBUILD WITH (FILLFACTOR = 80)
Print '380' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_HHTMaster] ON IG_I_HHTmasterdetails REBUILD WITH (FILLFACTOR = 80)
Print '381' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_IQDataList] ON IG_I_IQDataList REBUILD WITH (FILLFACTOR = 80)
Print '382' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_JourneyPlan] ON IG_I_JourneyPlan REBUILD WITH (FILLFACTOR = 80)
Print '383' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_ListSelection] ON IG_I_ListSelection REBUILD WITH (FILLFACTOR = 80)
Print '384' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_LocationDetails] ON IG_I_LocationDetails REBUILD WITH (FILLFACTOR = 80)
Print '385' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_MOC] ON IG_I_MOC REBUILD WITH (FILLFACTOR = 80)
Print '386' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_OrderHistoryV1] ON IG_I_OrderHistoryV1 REBUILD WITH (FILLFACTOR = 80)
Print '387' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_PendingInvoice] ON IG_I_PendingInvoice REBUILD WITH (FILLFACTOR = 80)
Print '388' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_PerfectStoreStatus] ON IG_I_PerfectStoreStatus REBUILD WITH (FILLFACTOR = 80)
Print '389' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_PricingPlan] ON IG_I_PricingPlan REBUILD WITH (FILLFACTOR = 80)
Print '390' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_Product] ON IG_I_Product REBUILD WITH (FILLFACTOR = 80)
Print '391' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_ProductHierarchyV1] ON IG_I_ProductHierarchyV1 REBUILD WITH (FILLFACTOR = 80)
Print '392' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_PromotionAssignment] ON IG_I_PromotionAssignment REBUILD WITH (FILLFACTOR = 80)
Print '393' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_PromotionControl] ON IG_I_PromotionControl REBUILD WITH (FILLFACTOR = 80)
Print '394' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_PromotionCustomer] ON IG_I_PromotionCustomer REBUILD WITH (FILLFACTOR = 80)
Print '395' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_PromotionGroup] ON IG_I_PromotionGroup REBUILD WITH (FILLFACTOR = 80)
Print '396' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_RoutePromotionQuota] ON IG_I_RoutePromotionQuota REBUILD WITH (FILLFACTOR = 80)
Print '397' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_RouteSetupV2] ON IG_I_RouteSetupV2 REBUILD WITH (FILLFACTOR = 80)
Print '398' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_RouteTarget_1] ON IG_I_RouteTarget REBUILD WITH (FILLFACTOR = 80)
Print '399' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_RouteTarget_v1] ON IG_I_RouteTargetV1 REBUILD WITH (FILLFACTOR = 80)
Print '400' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_SalesInvoiceDetails] ON IG_I_SalesInvoiceDetails REBUILD WITH (FILLFACTOR = 80)
Print '401' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_SalesInvoiceHeader] ON IG_I_SalesInvoiceHeader REBUILD WITH (FILLFACTOR = 80)
Print '402' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_SalesmanDetails] ON IG_I_SalesmanDetails REBUILD WITH (FILLFACTOR = 80)
Print '403' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_StreetDetails] ON IG_I_StreetDetails REBUILD WITH (FILLFACTOR = 80)
Print '404' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_TaxDetails] ON IG_I_TaxDetails REBUILD WITH (FILLFACTOR = 80)
Print '405' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_VanLoad] ON IG_I_VanLoad REBUILD WITH (FILLFACTOR = 80)
Print '406' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_VanStock] ON IG_I_VanStock REBUILD WITH (FILLFACTOR = 80)
Print '407' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_VehicleDetails] ON IG_I_VehicleDetails REBUILD WITH (FILLFACTOR = 80)
Print '408' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_WarehouseDetails] ON IG_I_WarehouseDetails REBUILD WITH (FILLFACTOR = 80)
Print '409' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_I_WarehouseInventory] ON IG_I_WarehouseInventory REBUILD WITH (FILLFACTOR = 80)
Print '410' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_KPIConfiguration] ON IG_KPIConfiguration REBUILD WITH (FILLFACTOR = 80)
Print '411' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_AppliedEntries] ON IG_O_AppliedEntries REBUILD WITH (FILLFACTOR = 80)
Print '412' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_AssetVerification] ON IG_O_AssetVerification REBUILD WITH (FILLFACTOR = 80)
Print '413' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_CollectionDetail] ON IG_O_CollectionDetail REBUILD WITH (FILLFACTOR = 80)
Print '414' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_CollectionDetail_Split] ON IG_O_CollectionDetail_Split REBUILD WITH (FILLFACTOR = 80)
Print '415' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_CollectionHeader] ON IG_O_CollectionHeader REBUILD WITH (FILLFACTOR = 80)
Print '416' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_CustomerGeoCode] ON IG_O_CustomerGeoCode REBUILD WITH (FILLFACTOR = 80)
Print '417' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_LoadRequestDetail] ON IG_O_LoadRequestDetail REBUILD WITH (FILLFACTOR = 80)
Print '418' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_LoadRequestHeader] ON IG_O_LoadRequestHeader REBUILD WITH (FILLFACTOR = 80)
Print '419' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_NewCustomer] ON IG_O_NewCustomer REBUILD WITH (FILLFACTOR = 80)
Print '420' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_ProspectDetails] ON IG_O_ProspectDetails REBUILD WITH (FILLFACTOR = 80)
Print '421' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_RetailerContactInfo] ON IG_O_RetailerContactInfo REBUILD WITH (FILLFACTOR = 80)
Print '422' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_SalesOrderDetail_1] ON IG_O_SalesOrderDetail REBUILD WITH (FILLFACTOR = 80)
Print '423' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_SalesOrderHeader] ON IG_O_SalesOrderHeader REBUILD WITH (FILLFACTOR = 80)
Print '424' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_SalesOrderPromotion] ON IG_O_SalesOrderPromotion REBUILD WITH (FILLFACTOR = 80)
Print '425' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_SalesOrderReturnExchange] ON IG_O_SalesOrderReturnExchange REBUILD WITH (FILLFACTOR = 80)
Print '426' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_SurveyDetail] ON IG_O_SurveyDetail REBUILD WITH (FILLFACTOR = 80)
Print '427' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_SurveyHeader] ON IG_O_SurveyHeader REBUILD WITH (FILLFACTOR = 80)
Print '428' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_UploadSyncKeys] ON IG_O_UploadSyncKeys REBUILD WITH (FILLFACTOR = 80)
Print '429' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_O_VisitSummary] ON IG_O_VisitSummary REBUILD WITH (FILLFACTOR = 80)
Print '430' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_SCHEDULE] ON IG_SCHEDULE REBUILD WITH (FILLFACTOR = 80)
Print '431' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_STATUS] ON IG_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '432' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_TASK] ON IG_TASK REBUILD WITH (FILLFACTOR = 80)
Print '433' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_TASK_GROUP] ON IG_TASK_GROUP REBUILD WITH (FILLFACTOR = 80)
Print '434' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_Task_Queue] ON IG_Task_Queue REBUILD WITH (FILLFACTOR = 80)
Print '435' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_TRANS_LOG] ON IG_TRANS_LOG REBUILD WITH (FILLFACTOR = 80)
Print '436' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_TRANS_LOG_DETAIL] ON IG_TRANS_LOG_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '437' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_TRANS_LOG_SDETAIL] ON IG_TRANS_LOG_SDETAIL REBUILD WITH (FILLFACTOR = 80)
Print '438' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_TRANS_LOG_XML] ON IG_TRANS_LOG_XML REBUILD WITH (FILLFACTOR = 80)
Print '439' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IG_VersionHistory] ON IG_VersionHistory REBUILD WITH (FILLFACTOR = 80)
Print '440' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IGI_I_Customer] ON IG_I_Customer REBUILD WITH (FILLFACTOR = 80)
Print '441' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IMAGECAPTURE] ON IMAGECAPTURE REBUILD WITH (FILLFACTOR = 80)
Print '442' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INCENTIVE_DETAIL] ON INCENTIVE_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '443' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INCENTIVE_FOR] ON INCENTIVE_FOR REBUILD WITH (FILLFACTOR = 80)
Print '444' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INCENTIVE_HEAD] ON INCENTIVE_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '445' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INCENTIVE_MASTER] ON INCENTIVE_MASTER REBUILD WITH (FILLFACTOR = 80)
Print '446' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INCENTIVE_POP_Adjustment_Detail] ON INCENTIVE_POP_Adjustment_Detail REBUILD WITH (FILLFACTOR = 80)
Print '447' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INCENTIVE_POP_TRANSACTION] ON INCENTIVE_POP_TRANSACTION REBUILD WITH (FILLFACTOR = 80)
Print '448' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INCENTIVE_SCHEME_DETAIL] ON INCENTIVE_SCHEME_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '449' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INCENTIVE_SCHEME_MASTER] ON INCENTIVE_SCHEME_MASTER REBUILD WITH (FILLFACTOR = 80)
Print '450' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INCENTIVE_SCHEME_POP] ON INCENTIVE_SCHEME_POP REBUILD WITH (FILLFACTOR = 80)
Print '451' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INCENTIVE_SLAB] ON INCENTIVE_SLAB REBUILD WITH (FILLFACTOR = 80)
Print '452' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INCENTIVE_TYPE] ON INCENTIVE_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '453' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INDUSTRY] ON INDUSTRY REBUILD WITH (FILLFACTOR = 80)
Print '454' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INTERFACE_DETAIL] ON INTERFACE_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '455' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INTERFACE_MASTER] ON INTERFACE_MASTER REBUILD WITH (FILLFACTOR = 80)
Print '456' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INTERFACE_POP_TRANSACTION] ON INTERFACE_POP_TRANSACTION REBUILD WITH (FILLFACTOR = 80)
Print '457' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INTERFACE_SCHEME_DETAIL] ON INTERFACE_SCHEME_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '458' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INTERFACE_SCHEME_MASTER] ON INTERFACE_SCHEME_MASTER REBUILD WITH (FILLFACTOR = 80)
Print '459' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INTERFACE_SCHEME_POP] ON INTERFACE_SCHEME_POP REBUILD WITH (FILLFACTOR = 80)
Print '460' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INVOICE_CLAIM] ON INVOICE_CLAIM REBUILD WITH (FILLFACTOR = 80)
Print '461' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INVOICE_DETAIL] ON INVOICE_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '462' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_INVOICE_HEAD] ON INVOICE_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '463' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IO_NUMBER] ON IO_NUMBER REBUILD WITH (FILLFACTOR = 80)
Print '464' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_IQ_FILE_INFO] ON IQ_FILE_INFO REBUILD WITH (FILLFACTOR = 80)
Print '465' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_J_CYCLE] ON J_CYCLE REBUILD WITH (FILLFACTOR = 80)
Print '466' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_JC_WEEK] ON JC_WEEK REBUILD WITH (FILLFACTOR = 80)
Print '467' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_JOB_QUEUE] ON BATCH_JOB_QUEUE REBUILD WITH (FILLFACTOR = 80)
Print '468' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_JOB_TYPE] ON JOB_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '469' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_KEY_CUSTOMER] ON KEY_CUSTOMER REBUILD WITH (FILLFACTOR = 80)
Print '470' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_KEY_CUSTOMER_LEVEL] ON KEY_CUSTOMER_LEVEL REBUILD WITH (FILLFACTOR = 80)
Print '471' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LOAD_REQUEST] ON LOAD_REQUEST REBUILD WITH (FILLFACTOR = 80)
Print '472' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LOAD_REQUEST_DETAIL] ON LOAD_REQUEST_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '473' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LOCALITY] ON LOCALITY REBUILD WITH (FILLFACTOR = 80)
Print '474' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LOCATION] ON LOCATION REBUILD WITH (FILLFACTOR = 80)
Print '475' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LOG_BOOK] ON LOG_BOOK REBUILD WITH (FILLFACTOR = 80)
Print '476' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LOSS_LEVEL] ON LOSS_LEVEL REBUILD WITH (FILLFACTOR = 80)
Print '477' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LOSS_REASON] ON LOSS_REASON REBUILD WITH (FILLFACTOR = 80)
Print '478' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LP_ACCOUNT_LEDGER] ON LP_ACCOUNT_LEDGER REBUILD WITH (FILLFACTOR = 80)
Print '479' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LP_ACCOUNT_TRANS] ON LP_ACCOUNT_TRANS REBUILD WITH (FILLFACTOR = 80)
Print '480' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LP_LOYALTY_ACCOUNT] ON LP_LOYALTY_ACCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '481' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LP_LOYALTY_POLICY] ON LP_LOYALTY_POLICY REBUILD WITH (FILLFACTOR = 80)
Print '482' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LP_LOYALTY_PRODUCT] ON LP_LOYALTY_PRODUCT REBUILD WITH (FILLFACTOR = 80)
Print '483' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LP_LOYALTY_TRANS] ON LP_LOYALTY_TRANS REBUILD WITH (FILLFACTOR = 80)
Print '484' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LP_LOYALTY_TRANS_DETAIL] ON LP_LOYALTY_TRANS_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '485' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_LSM] ON LSM REBUILD WITH (FILLFACTOR = 80)
Print '486' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MARKET_ACTIVITY] ON MARKET_ACTIVITY REBUILD WITH (FILLFACTOR = 80)
Print '487' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MARKET_ACTIVITY_DETAIL] ON MARKET_ACTIVITY_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '488' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MASTER_CHANNEL] ON MASTER_CHANNEL REBUILD WITH (FILLFACTOR = 80)
Print '489' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Master_Screen] ON Master_Screen REBUILD WITH (FILLFACTOR = 80)
Print '490' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Master_Screen_Desig] ON Master_Screen_Desig REBUILD WITH (FILLFACTOR = 80)
Print '491' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MASTER_SKU] ON MASTER_SKU REBUILD WITH (FILLFACTOR = 80)
Print '492' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MASTER_SKU_MAPPING] ON MASTER_SKU_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '493' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MasterCard_Payment] ON MasterCard_Payment REBUILD WITH (FILLFACTOR = 80)
Print '494' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_masterskuassortment] ON masterskuassortment REBUILD WITH (FILLFACTOR = 80)
Print '495' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_Capability] ON MBZ_Capability REBUILD WITH (FILLFACTOR = 80)
Print '496' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_Command] ON MBZ_MOCommand REBUILD WITH (FILLFACTOR = 80)
Print '497' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_Credit] ON MBZ_Credit REBUILD WITH (FILLFACTOR = 80)
Print '498' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_EmailMessage] ON MBZ_EmailMessage REBUILD WITH (FILLFACTOR = 80)
Print '499' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_Inbox] ON MBZ_Inbox REBUILD WITH (FILLFACTOR = 80)
Print '500' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_MOLog] ON MBZ_MOLog REBUILD WITH (FILLFACTOR = 80)
Print '501' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Mbz_NetworksOperator] ON MBZ_NetworksOperator REBUILD WITH (FILLFACTOR = 80)
Print '502' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_Outbox] ON MBZ_OutBox REBUILD WITH (FILLFACTOR = 80)
Print '503' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_PARAMLIMIT] ON MBZ_PARAMLIMIT REBUILD WITH (FILLFACTOR = 80)
Print '504' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_RoleCapability] ON MBZ_RoleCapability REBUILD WITH (FILLFACTOR = 80)
Print '505' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_Route] ON MBZ_Route REBUILD WITH (FILLFACTOR = 80)
Print '506' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_RouteType] ON MBZ_RouteType REBUILD WITH (FILLFACTOR = 80)
Print '507' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_ShortCode_1] ON MBZ_ShortCode REBUILD WITH (FILLFACTOR = 80)
Print '508' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_TEMPLATECATEGORY] ON MBZ_TEMPLATECATEGORY REBUILD WITH (FILLFACTOR = 80)
Print '509' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_Users] ON MBZ_Users REBUILD WITH (FILLFACTOR = 80)
Print '510' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_UsersInRoles] ON MBZ_UsersInRoles REBUILD WITH (FILLFACTOR = 80)
Print '511' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MBZ_Vendors] ON MBZ_Vendors REBUILD WITH (FILLFACTOR = 80)
Print '512' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MEMORY_VARIABLE] ON MEMORY_VARIABLE REBUILD WITH (FILLFACTOR = 80)
Print '513' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_memory_variable_Detail] ON memory_variable_Detail REBUILD WITH (FILLFACTOR = 80)
Print '514' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MERGE_SKU_DETAIL] ON MERGE_SKU_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '515' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MERGE_SKU_HEAD] ON MERGE_SKU_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '516' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MIS_KPI] ON MIS_KPI REBUILD WITH (FILLFACTOR = 80)
Print '517' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MIS_KPI_DATA] ON MIS_KPI_DATA REBUILD WITH (FILLFACTOR = 80)
Print '518' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MIS_KPI_DATA_206] ON MIS_KPI_DATA_206 REBUILD WITH (FILLFACTOR = 80)
Print '519' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MIS_KPI_DATA_503] ON MIS_KPI_DATA_503 REBUILD WITH (FILLFACTOR = 80)
Print '520' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MIS_KPI_DATA_504] ON MIS_KPI_DATA_504 REBUILD WITH (FILLFACTOR = 80)
Print '521' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MIS_KPI_DATA_505] ON MIS_KPI_DATA_505 REBUILD WITH (FILLFACTOR = 80)
Print '522' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MIS_KPI_DATA_700] ON MIS_KPI_DATA_700 REBUILD WITH (FILLFACTOR = 80)
Print '523' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MIS_KPI_DATA_802] ON MIS_KPI_DATA_802 REBUILD WITH (FILLFACTOR = 80)
Print '524' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MS_BatchOrders_1] ON MS_BatchOrders REBUILD WITH (FILLFACTOR = 80)
Print '525' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MS_TRANS_LOG] ON MS_TRANS_LOG REBUILD WITH (FILLFACTOR = 80)
Print '526' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MS_TRANS_LOG_XML] ON MS_TRANS_LOG_XML REBUILD WITH (FILLFACTOR = 80)
Print '527' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_MTD_DATA] ON MTD_DATA REBUILD WITH (FILLFACTOR = 80)
Print '528' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_OPTION_FIELD_DATA] ON OPTION_FIELD_DATA REBUILD WITH (FILLFACTOR = 80)
Print '529' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_OPTION_FIELD_MAPPING] ON OPTION_FIELD_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '530' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_OPTION_SETUP] ON OPTION_SETUP REBUILD WITH (FILLFACTOR = 80)
Print '531' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_OUTLET_HIERARCHY_LSR2] ON OUTLET_HIERARCHY_LSR2 REBUILD WITH (FILLFACTOR = 80)
Print '532' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_OUTLET_HIERARCHY_LSW] ON OUTLET_HIERARCHY_LSW REBUILD WITH (FILLFACTOR = 80)
Print '533' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PARAM_SYNC_SETUP] ON PARAM_SYNC_SETUP REBUILD WITH (FILLFACTOR = 80)
Print '534' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PAYMENT_ADJ] ON PAYMENT_ADJ REBUILD WITH (FILLFACTOR = 80)
Print '535' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PAYMENT_HEAD] ON PAYMENT_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '536' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Payment_Mode] ON Payment_Mode REBUILD WITH (FILLFACTOR = 80)
Print '537' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PAYMENT_TYPE] ON PAYMENT_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '538' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Pb_Login] ON Pb_Login REBUILD WITH (FILLFACTOR = 80)
Print '539' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_pb_setup] ON pb_setup REBUILD WITH (FILLFACTOR = 80)
Print '540' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PD_BaseInfo] ON PD_BaseInfo REBUILD WITH (FILLFACTOR = 80)
Print '541' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PD_Description] ON PD_Description REBUILD WITH (FILLFACTOR = 80)
Print '542' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PD_POPDefinition] ON PD_POPDefinition REBUILD WITH (FILLFACTOR = 80)
Print '543' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PD_POPTargetTotal] ON PD_POPTargetTotal REBUILD WITH (FILLFACTOR = 80)
Print '544' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PD_SKU] ON PD_SKU REBUILD WITH (FILLFACTOR = 80)
Print '545' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PD_SKUTYPE] ON PD_SKUTYPE REBUILD WITH (FILLFACTOR = 80)
Print '546' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PERFECT_STORE_LEVEL] ON Perfect_Store_Level REBUILD WITH (FILLFACTOR = 80)
Print '547' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PERIOD_CALENDAR] ON PERIOD_CALENDAR REBUILD WITH (FILLFACTOR = 80)
Print '548' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PERIOD_TYPE] ON PERIOD_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '549' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PHYSICAL_STOCK] ON PHYSICAL_STOCK REBUILD WITH (FILLFACTOR = 80)
Print '550' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PHYSICAL_STOCK_DETAIL] ON PHYSICAL_STOCK_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '551' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PHYSICAL_STOCK_HEAD] ON PHYSICAL_STOCK_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '552' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PI_DOCUMENT] ON PI_DOCUMENT REBUILD WITH (FILLFACTOR = 80)
Print '553' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PI_GROUP_TASK] ON BATCH_GROUP_TASK REBUILD WITH (FILLFACTOR = 80)
Print '554' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PI_UPDATED_VERSION] ON PI_UPDATED_VERSION REBUILD WITH (FILLFACTOR = 80)
Print '555' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PJP_DETAIL] ON PJP_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '556' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PJP_DETAIL_Temp] ON PJP_DETAIL_Temp REBUILD WITH (FILLFACTOR = 80)
Print '557' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PJP_HEAD] ON PJP_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '558' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PJP_HEAD_Temp] ON PJP_HEAD_Temp REBUILD WITH (FILLFACTOR = 80)
Print '559' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PJPSKU_ALLOCATION] ON PJPSKU_ALLOCATION REBUILD WITH (FILLFACTOR = 80)
Print '560' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PLANOGRAM] ON PLANOGRAM REBUILD WITH (FILLFACTOR = 80)
Print '561' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PLANOGRAM_DETAIL] ON PLANOGRAM_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '562' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PLANOGRAM_REC] ON PLANOGRAM_REC REBUILD WITH (FILLFACTOR = 80)
Print '563' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PLANOGRAM_REC_DTL] ON PLANOGRAM_REC_DTL REBUILD WITH (FILLFACTOR = 80)
Print '564' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POLICY] ON POLICY REBUILD WITH (FILLFACTOR = 80)
Print '565' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POLICY_DETAIL] ON POLICY_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '566' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POLICY_SLAB] ON POLICY_SLAB REBUILD WITH (FILLFACTOR = 80)
Print '567' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP] ON POP REBUILD WITH (FILLFACTOR = 80)
Print '568' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_ACCOUNT] ON POP_ACCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '569' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_ACCOUNT_TEMP] ON POP_ACCOUNT_TEMP REBUILD WITH (FILLFACTOR = 80)
Print '570' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_AGREEMENT_RECEIPT] ON POP_AGREEMENT_RECEIPT REBUILD WITH (FILLFACTOR = 80)
Print '571' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_AGREEMENT_RECEIPT_DETAIL] ON POP_AGREEMENT_RECEIPT_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '572' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_ATTRIBUTE] ON POP_ATTRIBUTE REBUILD WITH (FILLFACTOR = 80)
Print '573' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_ATTRIBUTE_LOG] ON POP_ATTRIBUTE_LOG REBUILD WITH (FILLFACTOR = 80)
Print '574' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_ATTRIBUTE_TEMP] ON POP_ATTRIBUTE_TEMP REBUILD WITH (FILLFACTOR = 80)
Print '575' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_BANK] ON POP_BANK REBUILD WITH (FILLFACTOR = 80)
Print '576' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_BANK_Temp] ON POP_BANK_Temp REBUILD WITH (FILLFACTOR = 80)
Print '577' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_BANNER] ON POP_BANNER REBUILD WITH (FILLFACTOR = 80)
Print '578' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_BRANDED] ON POP_BRANDED REBUILD WITH (FILLFACTOR = 80)
Print '579' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_BRANDED_TEMP] ON POP_BRANDED_TEMP REBUILD WITH (FILLFACTOR = 80)
Print '580' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_CHANGE_REQ] ON POP_CHANGE_REQ REBUILD WITH (FILLFACTOR = 80)
Print '581' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_CHANGE_REQ_DETAIL] ON POP_CHANGE_REQ_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '582' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_CONTACT] ON POP_CONTACT REBUILD WITH (FILLFACTOR = 80)
Print '583' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_CONTACT_TEMP] ON POP_CONTACT_TEMP REBUILD WITH (FILLFACTOR = 80)
Print '584' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_CREDIT] ON POP_CREDIT REBUILD WITH (FILLFACTOR = 80)
Print '585' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_CREDIT_TEMP] ON POP_CREDIT_TEMP REBUILD WITH (FILLFACTOR = 80)
Print '586' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_DISCOUNT] ON POP_DISCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '587' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_DISCOUNT_REQUEST] ON POP_DISCOUNT_REQUEST REBUILD WITH (FILLFACTOR = 80)
Print '588' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_DISCOUNT_REQUEST_LOG] ON POP_DISCOUNT_REQUEST_LOG REBUILD WITH (FILLFACTOR = 80)
Print '589' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_DISCOUNT_TRANSACTION] ON POP_DISCOUNT_TRANSACTION REBUILD WITH (FILLFACTOR = 80)
Print '590' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_DISTRIBUTOR_MAPPING] ON POP_DISTRIBUTOR_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '591' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_HANDLER] ON POP_HANDLER REBUILD WITH (FILLFACTOR = 80)
Print '592' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_LEDGER] ON POP_LEDGER REBUILD WITH (FILLFACTOR = 80)
Print '593' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_LEDGER_SKU] ON POP_LEDGER_SKU REBUILD WITH (FILLFACTOR = 80)
Print '594' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_MASTER] ON POP_MASTER REBUILD WITH (FILLFACTOR = 80)
Print '595' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_MERCHANDIZING] ON POP_MERCHANDIZING REBUILD WITH (FILLFACTOR = 80)
Print '596' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_PROD1_INFO] ON POP_PROD1_INFO REBUILD WITH (FILLFACTOR = 80)
Print '597' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_RANK] ON POP_RANK REBUILD WITH (FILLFACTOR = 80)
Print '598' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_RANK_TEMP] ON POP_RANK_TEMP REBUILD WITH (FILLFACTOR = 80)
Print '599' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_SALE_HISTORY] ON POP_SALE_HISTORY REBUILD WITH (FILLFACTOR = 80)
Print '600' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_SCHEME_EXCEPT] ON POP_SCHEME_EXCEPT REBUILD WITH (FILLFACTOR = 80)
Print '601' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_STATUS] ON POP_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '602' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_STATUS_ASSET] ON POP_STATUS_ASSET REBUILD WITH (FILLFACTOR = 80)
Print '603' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_STATUS_DETAIL] ON POP_STATUS_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '604' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_TAX] ON POP_TAX REBUILD WITH (FILLFACTOR = 80)
Print '605' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_TAX_TEMP] ON POP_TAX_TEMP REBUILD WITH (FILLFACTOR = 80)
Print '606' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_TEMP] ON POP_TEMP REBUILD WITH (FILLFACTOR = 80)
Print '607' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_TYPE] ON POP_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '608' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_UNBRANDED] ON POP_UNBRANDED REBUILD WITH (FILLFACTOR = 80)
Print '609' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_POP_UNBRANDED_TEMP] ON POP_UNBRANDED_TEMP REBUILD WITH (FILLFACTOR = 80)
Print '610' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_AM_VE_VALCOMBENTRY] ON PR_AM_VE_VALCOMBENTRY REBUILD WITH (FILLFACTOR = 80)
Print '611' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_AM_VH_VALCOMBHEAD] ON PR_AM_VH_VALCOMBHEAD REBUILD WITH (FILLFACTOR = 80)
Print '612' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_AM_VV_VALCOMBVOUCHER] ON PR_AM_VV_VALCOMBVOUCHER REBUILD WITH (FILLFACTOR = 80)
Print '613' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_ED_KL_KEYLEVELS] ON PR_ED_KL_KEYLEVELS REBUILD WITH (FILLFACTOR = 80)
Print '614' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_ED_KN_KEYNUMGEN] ON PR_ED_KN_KEYNUMGEN REBUILD WITH (FILLFACTOR = 80)
Print '615' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_ED_NF_NUMGENFREQUENCY] ON PR_ED_NF_NUMGENFREQUENCY REBUILD WITH (FILLFACTOR = 80)
Print '616' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_ED_SE_SYSTEMENTITY] ON PR_ED_SE_SYSTEMENTITY REBUILD WITH (FILLFACTOR = 80)
Print '617' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_ER_NT_TRANSACTION_TYPE] ON PR_ER_NT_TRANSACTION_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '618' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_ER_VC_VERSIONCONTROL] ON PR_ER_VC_VERSIONCONTROL REBUILD WITH (FILLFACTOR = 80)
Print '619' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_AC_ADVICECHECKS] ON PR_GL_AC_ADVICECHECKS REBUILD WITH (FILLFACTOR = 80)
Print '620' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_AD_ADVICETYPE] ON PR_GL_AD_ADVICETYPE REBUILD WITH (FILLFACTOR = 80)
Print '621' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_CA_ACCOUNT] ON PR_GL_CA_ACCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '622' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_CA_CHARGEACCOUNT] ON PR_GL_CA_CHARGEACCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '623' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_CT_ACCOUNTTYPE] ON PR_GL_CT_ACCOUNTTYPE REBUILD WITH (FILLFACTOR = 80)
Print '624' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_LA_LINKACCOUNT] ON PR_GL_LA_LINKACCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '625' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_MT_MAPPINGTYPES] ON PR_GL_MT_MAPPINGTYPES REBUILD WITH (FILLFACTOR = 80)
Print '626' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_PC_LOCPRFCENTER] ON PR_GL_PC_LOCPRFCENTER REBUILD WITH (FILLFACTOR = 80)
Print '627' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_PF_PRFCENTER] ON PR_GL_PF_PRFCENTER REBUILD WITH (FILLFACTOR = 80)
Print '628' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_PM_PROFITCENTERMAPPING] ON PR_GL_PM_PROFITCENTERMAPPING REBUILD WITH (FILLFACTOR = 80)
Print '629' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_SA_SUBACCOUNTS] ON PR_GL_SA_SUBACCOUNTS REBUILD WITH (FILLFACTOR = 80)
Print '630' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_SP_SLTYPE] ON PR_GL_SP_SLTYPE REBUILD WITH (FILLFACTOR = 80)
Print '631' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_SR_SUBLEDCHARTACCOUNT] ON PR_GL_SR_SUBLEDCHARTACCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '632' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_VF_VOUCHERHEADERFIELD] ON PR_GL_VF_VOUCHERHEADERFIELD REBUILD WITH (FILLFACTOR = 80)
Print '633' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_VT_VOUCHERTYPE] ON PR_GL_VT_VOUCHERTYPE REBUILD WITH (FILLFACTOR = 80)
Print '634' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GL_VV_VOUCHERTYPEDETAIL] ON PR_GL_VV_VOUCHERTYPEDETAIL REBUILD WITH (FILLFACTOR = 80)
Print '635' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_AD_ENTITYADDRESS] ON PR_GN_AD_ENTITYADDRESS REBUILD WITH (FILLFACTOR = 80)
Print '636' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_AT_BANKACCOUNTTYPE] ON PR_GN_AT_BANKACCOUNTTYPE REBUILD WITH (FILLFACTOR = 80)
Print '637' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_BA_BANKACCOUNT] ON PR_GN_BA_BANKACCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '638' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_BA_BANKADMCLS] ON PR_GN_BA_BANKADMCLS REBUILD WITH (FILLFACTOR = 80)
Print '639' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_BN_BANKBRANCH] ON PR_GN_BN_BANKBRANCH REBUILD WITH (FILLFACTOR = 80)
Print '640' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_BT_BANKTYPE] ON PR_GN_BT_BANKTYPE REBUILD WITH (FILLFACTOR = 80)
Print '641' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_CI_CHEQINVENTORY] ON PR_GN_CI_CHEQINVENTORY REBUILD WITH (FILLFACTOR = 80)
Print '642' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_CL_CHEQLOCATION] ON PR_GN_CL_CHEQLOCATION REBUILD WITH (FILLFACTOR = 80)
Print '643' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_CR_CURRENCY] ON PR_GN_CR_CURRENCY REBUILD WITH (FILLFACTOR = 80)
Print '644' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_DP_DEPARTMENT] ON PR_GN_DP_DEPARTMENT REBUILD WITH (FILLFACTOR = 80)
Print '645' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_DT_DOCUMENTTYPE] ON PR_GN_DT_DOCUMENTTYPE REBUILD WITH (FILLFACTOR = 80)
Print '646' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_ER_EXCHRATE] ON PR_GN_ER_EXCHRATE REBUILD WITH (FILLFACTOR = 80)
Print '647' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_ET_EXCHRATETYPE] ON PR_GN_ET_EXCHRATETYPE REBUILD WITH (FILLFACTOR = 80)
Print '648' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_FM_FREQUENCYMODE] ON PR_GN_FM_FREQUENCYMODE REBUILD WITH (FILLFACTOR = 80)
Print '649' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_FS_FISCALYR] ON PR_GN_FS_FISCALYR REBUILD WITH (FILLFACTOR = 80)
Print '650' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_IT_IDENTIFIERTYPE] ON PR_GN_IT_IDENTIFIERTYPE REBUILD WITH (FILLFACTOR = 80)
Print '651' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_IT_INSTRUMENTTYPE] ON PR_GN_IT_INSTRUMENTTYPE REBUILD WITH (FILLFACTOR = 80)
Print '652' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_LC_LOCATION] ON PR_GN_LC_LOCATION REBUILD WITH (FILLFACTOR = 80)
Print '653' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_OR_ORGANIZATION] ON PR_GN_OR_ORGANIZATION REBUILD WITH (FILLFACTOR = 80)
Print '654' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_PD_PERIOD] ON PR_GN_PD_PERIOD REBUILD WITH (FILLFACTOR = 80)
Print '655' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_PT_PERIODTYPE] ON PR_GN_PT_PERIODTYPE REBUILD WITH (FILLFACTOR = 80)
Print '656' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_SY_SYSTEM] ON PR_GN_SY_SYSTEM REBUILD WITH (FILLFACTOR = 80)
Print '657' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_TM_TRANSFERMODE] ON PR_GN_TM_TRANSFERMODE REBUILD WITH (FILLFACTOR = 80)
Print '658' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_TR_TRANSACTIONTYPE] ON PR_GN_TR_TRANSACTIONTYPE REBUILD WITH (FILLFACTOR = 80)
Print '659' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_YD_SYSTEMPARADTL] ON PR_GN_YD_SYSTEMPARADTL REBUILD WITH (FILLFACTOR = 80)
Print '660' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PR_GN_YH_SYSTEMPARAHD] ON PR_GN_YH_SYSTEMPARAHD REBUILD WITH (FILLFACTOR = 80)
Print '661' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_previous_town] ON previous_town REBUILD WITH (FILLFACTOR = 80)
Print '662' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PRICE_STRUCTURE] ON PRICE_STRUCTURE REBUILD WITH (FILLFACTOR = 80)
Print '663' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PRINCIPAL_GROUP] ON PRINCIPAL_GROUP REBUILD WITH (FILLFACTOR = 80)
Print '664' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PRINT_LOGID] ON DOCUMENT_PRINT_LOG REBUILD WITH (FILLFACTOR = 80)
Print '665' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_print_setup] ON print_setup REBUILD WITH (FILLFACTOR = 80)
Print '666' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROCESS_DETAIL] ON PROCESS_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '667' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_BRANDED] ON PROD_BRANDED REBUILD WITH (FILLFACTOR = 80)
Print '668' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_LEVEL_SETUP] ON PROD_LEVEL_SETUP REBUILD WITH (FILLFACTOR = 80)
Print '669' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_LEVEL1] ON PROD_LEVEL1 REBUILD WITH (FILLFACTOR = 80)
Print '670' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_LEVEL2] ON PROD_LEVEL2 REBUILD WITH (FILLFACTOR = 80)
Print '671' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_prod_level2_type] ON prod_level2_type REBUILD WITH (FILLFACTOR = 80)
Print '672' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_LEVEL3] ON PROD_LEVEL3 REBUILD WITH (FILLFACTOR = 80)
Print '673' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_LEVEL4] ON PROD_LEVEL4 REBUILD WITH (FILLFACTOR = 80)
Print '674' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_LEVEL5] ON PROD_LEVEL5 REBUILD WITH (FILLFACTOR = 80)
Print '675' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_LEVEL6] ON PROD_LEVEL6 REBUILD WITH (FILLFACTOR = 80)
Print '676' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_LEVEL7] ON PROD_LEVEL7 REBUILD WITH (FILLFACTOR = 80)
Print '677' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_LEVEL8] ON PROD_LEVEL8 REBUILD WITH (FILLFACTOR = 80)
Print '678' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_LEVEL9] ON PROD_LEVEL9 REBUILD WITH (FILLFACTOR = 80)
Print '679' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROD_UNBRANDED] ON PROD_UNBRANDED REBUILD WITH (FILLFACTOR = 80)
Print '680' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PRODUCT] ON PRODUCT REBUILD WITH (FILLFACTOR = 80)
Print '681' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROSPECT_REQUEST] ON PROSPECT_REQUEST REBUILD WITH (FILLFACTOR = 80)
Print '682' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PROVINCE] ON PROVINCE REBUILD WITH (FILLFACTOR = 80)
Print '683' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PURCHASEORDER_DETAIL] ON PURCHASEORDER_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '684' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PURCHASEORDER_HEAD] ON PURCHASEORDER_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '685' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_PurgeLog] ON PurgeLog REBUILD WITH (FILLFACTOR = 80)
Print '686' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_CONFIG_SYNCHRONIZER] ON QS_CONFIG_SYNCHRONIZER REBUILD WITH (FILLFACTOR = 80)
Print '687' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_DELETE_TRACK] ON QS_DELETE_TRACK REBUILD WITH (FILLFACTOR = 80)
Print '688' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_ERROR_LOG] ON QS_ERROR_LOG REBUILD WITH (FILLFACTOR = 80)
Print '689' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_EXCEPTIONS] ON QS_EXCEPTIONS REBUILD WITH (FILLFACTOR = 80)
Print '690' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_GROUP] ON QS_GROUP REBUILD WITH (FILLFACTOR = 80)
Print '691' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_GROUP_RELATION] ON QS_GROUP_RELATION REBUILD WITH (FILLFACTOR = 80)
Print '692' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_LOG] ON QS_LOG REBUILD WITH (FILLFACTOR = 80)
Print '693' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_LOG_DETAIL] ON QS_LOG_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '694' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_OPERATION_TYPE] ON QS_OPERATION_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '695' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_PARAMETERS] ON QS_PARAMETERS REBUILD WITH (FILLFACTOR = 80)
Print '696' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_PROCESS_QUEUE] ON QS_PROCESS_QUEUE REBUILD WITH (FILLFACTOR = 80)
Print '697' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_QUEUE] ON QS_QUEUE REBUILD WITH (FILLFACTOR = 80)
Print '698' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_QUEUE_STATE] ON QS_QUEUE_STATE REBUILD WITH (FILLFACTOR = 80)
Print '699' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_SCHEDULE] ON QS_SCHEDULE REBUILD WITH (FILLFACTOR = 80)
Print '700' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_SCHEDULE_DETAIL] ON QS_SCHEDULE_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '701' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_SCHEDULE_MAPPING] ON QS_SCHEDULE_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '702' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_SCHEDULE_TYPE] ON QS_SCHEDULE_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '703' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_SYNCHRONIZER] ON QS_SYNCHRONIZER REBUILD WITH (FILLFACTOR = 80)
Print '704' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_TABLE] ON QS_TABLE REBUILD WITH (FILLFACTOR = 80)
Print '705' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_TABLE_CODE_OPERATION_VARIABLE] ON QS_TABLE_CODE_OPERATION_VARIABLE REBUILD WITH (FILLFACTOR = 80)
Print '706' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_TABLE_COLUMN] ON QS_TABLE_COLUMN REBUILD WITH (FILLFACTOR = 80)
Print '707' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_TABLE_COLUMNS_MAPPING] ON QS_TABLE_COLUMNS_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '708' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_UPDATED_VERSION] ON QS_UPDATED_VERSION REBUILD WITH (FILLFACTOR = 80)
Print '709' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_VARIABLES_1] ON QS_VARIABLES REBUILD WITH (FILLFACTOR = 80)
Print '710' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QS_VERSION] ON QS_VERSION REBUILD WITH (FILLFACTOR = 80)
Print '711' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QUALIFICATION] ON QUALIFICATION REBUILD WITH (FILLFACTOR = 80)
Print '712' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_QUEUE_PRIORITY] ON QS_PROCESS_QUEUE_PRIORITY REBUILD WITH (FILLFACTOR = 80)
Print '713' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RA_HEAD] ON RA_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '714' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RANK_POLICY] ON RANK_POLICY REBUILD WITH (FILLFACTOR = 80)
Print '715' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RANK_POLICY_DETAIL] ON RANK_POLICY_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '716' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RECEIPT_ADJ] ON RECEIPT_ADJ REBUILD WITH (FILLFACTOR = 80)
Print '717' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RECEIPT_DETAIL] ON RECEIPT_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '718' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RECEIPT_DETAIL_SKU] ON RECEIPT_DETAIL_SKU REBUILD WITH (FILLFACTOR = 80)
Print '719' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RECEIPT_HEAD] ON RECEIPT_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '720' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RECEIPT_TYPE] ON RECEIPT_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '721' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RED_AGREEMENT_DETAIL] ON RED_AGREEMENT_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '722' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RED_AGREEMENT_HEAD] ON RED_AGREEMENT_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '723' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RED_AGREMENT_MASTER] ON RED_AGREMENT_MASTER REBUILD WITH (FILLFACTOR = 80)
Print '724' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_REFERENCEDSKU] ON REFERENCEDSKU REBUILD WITH (FILLFACTOR = 80)
Print '725' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RELEASE_DIRECTORY] ON RELEASE_DIRECTORY REBUILD WITH (FILLFACTOR = 80)
Print '726' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RepairShop] ON RepairShop REBUILD WITH (FILLFACTOR = 80)
Print '727' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RESOURCE] ON RESOURCE REBUILD WITH (FILLFACTOR = 80)
Print '728' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RESOURCE_TYPE] ON RESOURCE_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '729' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RFT_LOG] ON RFT_LOG REBUILD WITH (FILLFACTOR = 80)
Print '730' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RFT_POP] ON RFT_POP REBUILD WITH (FILLFACTOR = 80)
Print '731' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RFT_POP_ASSET] ON RFT_POP_ASSET REBUILD WITH (FILLFACTOR = 80)
Print '732' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RFT_POP_SALES] ON RFT_POP_SALES REBUILD WITH (FILLFACTOR = 80)
Print '733' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_ROAD_TYPE] ON ROAD_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '734' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RtMessageTemplate] ON RtMessageTemplate REBUILD WITH (FILLFACTOR = 80)
Print '735' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RtNotifications] ON RtNotifications REBUILD WITH (FILLFACTOR = 80)
Print '736' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_RtProductRCMapping] ON RtProductRCMapping REBUILD WITH (FILLFACTOR = 80)
Print '737' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SADJ_HEAD] ON SADJ_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '738' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SALE_GROUP] ON SALE_GROUP REBUILD WITH (FILLFACTOR = 80)
Print '739' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SAM_DETAIL] ON SAM_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '740' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SAM_HEAD] ON SAM_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '741' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Scheme_allocation] ON Scheme_allocation REBUILD WITH (FILLFACTOR = 80)
Print '742' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Scheme_Allocation_Detail] ON Scheme_Allocation_Detail REBUILD WITH (FILLFACTOR = 80)
Print '743' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Scheme_Allocation_For] ON Scheme_Allocation_For REBUILD WITH (FILLFACTOR = 80)
Print '744' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SCHEME_ALLOCATION_ONSALE] ON SCHEME_ALLOCATION_ONSALE REBUILD WITH (FILLFACTOR = 80)
Print '745' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SCHEME_DISCOUNT] ON SCHEME_DISCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '746' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SCHEME_DISCOUNT_DETAIL] ON SCHEME_DISCOUNT_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '747' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SCHEME_DISCOUNT_DETAIL_SR] ON SCHEME_DISCOUNT_DETAIL_SR REBUILD WITH (FILLFACTOR = 80)
Print '748' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SCHEME_DISCOUNT_SR] ON SCHEME_DISCOUNT_SR REBUILD WITH (FILLFACTOR = 80)
Print '749' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SCHEME_LIMITS] ON SCHEME_LIMITS REBUILD WITH (FILLFACTOR = 80)
Print '750' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SCHEME_POP] ON SCHEME_POP REBUILD WITH (FILLFACTOR = 80)
Print '751' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Scheme_Rule] ON Scheme_Rule REBUILD WITH (FILLFACTOR = 80)
Print '752' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Scheme_Rule_Detail] ON Scheme_Rule_Detail REBUILD WITH (FILLFACTOR = 80)
Print '753' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SCHEME_SKU] ON SCHEME_SKU REBUILD WITH (FILLFACTOR = 80)
Print '754' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SCHEME_SKU_SR] ON SCHEME_SKU_SR REBUILD WITH (FILLFACTOR = 80)
Print '755' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SCHEME_SKU_VARIANT] ON SCHEME_SKU_VARIANT REBUILD WITH (FILLFACTOR = 80)
Print '756' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SCHEME_TYPE] ON SCHEME_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '757' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_scheme_variant] ON scheme_variant REBUILD WITH (FILLFACTOR = 80)
Print '758' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_scheme_variant_disc] ON scheme_variant_disc REBUILD WITH (FILLFACTOR = 80)
Print '759' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Screen_New] ON Screen_New REBUILD WITH (FILLFACTOR = 80)
Print '760' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Screen_New_Desig] ON Screen_New_Desig REBUILD WITH (FILLFACTOR = 80)
Print '761' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SD_TRANS] ON SD_TRANS REBUILD WITH (FILLFACTOR = 80)
Print '762' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SD_TRANS_DETAIL] ON SD_TRANS_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '763' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SECTION] ON SECTION REBUILD WITH (FILLFACTOR = 80)
Print '764' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SECTION_POP] ON SECTION_POP REBUILD WITH (FILLFACTOR = 80)
Print '765' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Section_POP_Asset] ON Section_POP_Asset REBUILD WITH (FILLFACTOR = 80)
Print '766' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SECTION_POP_PERMANENT] ON SECTION_POP_PERMANENT REBUILD WITH (FILLFACTOR = 80)
Print '767' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SECTION_POP_PERMANENT_temp] ON SECTION_POP_PERMANENT_temp REBUILD WITH (FILLFACTOR = 80)
Print '768' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SECTION_SKUQTY] ON SECTION_SKUQTY REBUILD WITH (FILLFACTOR = 80)
Print '769' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SECTION_temp] ON SECTION_temp REBUILD WITH (FILLFACTOR = 80)
Print '770' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SELL_CAT_PROD_MAPPING] ON SELL_CAT_PROD_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '771' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SELLING_CATEGORY] ON SELLING_CATEGORY REBUILD WITH (FILLFACTOR = 80)
Print '772' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SenderReceiverLocation] ON SenderReceiverLocation REBUILD WITH (FILLFACTOR = 80)
Print '773' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SERVICE_STATUS] ON SERVICE_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '774' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SH_SM_AA_APPLICATION] ON SH_SM_AA_APPLICATION REBUILD WITH (FILLFACTOR = 80)
Print '775' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SH_SM_SS_SYSTEM] ON SH_SM_SS_SYSTEM REBUILD WITH (FILLFACTOR = 80)
Print '776' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SHOPPER_TYPE] ON SHOPPER_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '777' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SKU] ON SKU REBUILD WITH (FILLFACTOR = 80)
Print '778' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SKU_BUNDLE] ON SKU_BUNDLE REBUILD WITH (FILLFACTOR = 80)
Print '779' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SKU_CATEGORY] ON SKU_CATEGORY REBUILD WITH (FILLFACTOR = 80)
Print '780' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SKU_POLICY] ON SKU_POLICY REBUILD WITH (FILLFACTOR = 80)
Print '781' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SKU_TYPE] ON SKU_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '782' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SkuPolicy] ON SkuPolicy REBUILD WITH (FILLFACTOR = 80)
Print '783' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SKUTARGET] ON SKUTARGET REBUILD WITH (FILLFACTOR = 80)
Print '784' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SKUTarget_Brand] ON SKUTarget_Brand REBUILD WITH (FILLFACTOR = 80)
Print '785' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SSC_Category] ON SSC_Category REBUILD WITH (FILLFACTOR = 80)
Print '786' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SSC_Category_POP] ON SSC_Category_POP REBUILD WITH (FILLFACTOR = 80)
Print '787' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SSC_POP_STATUS_DETAIL] ON SSC_POP_STATUS_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '788' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SSC_PRICECOMPLIANCE] ON SSC_PRICECOMPLIANCE REBUILD WITH (FILLFACTOR = 80)
Print '789' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SSC_PRICECOMPLIANCE_TRANS] ON SSC_PRICECOMPLIANCE_TRANS REBUILD WITH (FILLFACTOR = 80)
Print '790' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SSC_PRODLAUN_TRANS] ON SSC_PRODLAUN_TRANS REBUILD WITH (FILLFACTOR = 80)
Print '791' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SSC_PRODUCTLAUNCH] ON SSC_PRODUCTLAUNCH REBUILD WITH (FILLFACTOR = 80)
Print '792' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SSC_Ques_TRANS] ON SSC_Ques_TRANS REBUILD WITH (FILLFACTOR = 80)
Print '793' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SSC_Questions] ON SSC_Questions REBUILD WITH (FILLFACTOR = 80)
Print '794' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SSC_SubCategory] ON SSC_SubCategory REBUILD WITH (FILLFACTOR = 80)
Print '795' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STG_AVLVSL_DETAIL] ON STG_AVLVSL_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '796' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STG_CASHMEMO] ON STG_CASHMEMO REBUILD WITH (FILLFACTOR = 80)
Print '797' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STG_CASHMEMO_DETAIL] ON STG_CASHMEMO_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '798' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STG_DEPOSIT_SLIP] ON STG_DEPOSIT_SLIP REBUILD WITH (FILLFACTOR = 80)
Print '799' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STG_DEPOSIT_SLIP_DETAIL] ON STG_DEPOSIT_SLIP_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '800' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STG_POP_SCHEME_EXCEPT] ON STG_POP_SCHEME_EXCEPT REBUILD WITH (FILLFACTOR = 80)
Print '801' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STG_RECEIPT_DETAIL_SKU] ON STG_RECEIPT_DETAIL_SKU REBUILD WITH (FILLFACTOR = 80)
Print '802' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STG_RECEIPT_HEAD] ON STG_RECEIPT_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '803' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STG_SCHEME_DISCOUNT] ON STG_SCHEME_DISCOUNT REBUILD WITH (FILLFACTOR = 80)
Print '804' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STG_SCHEME_DISCOUNT_DETAIL] ON STG_SCHEME_DISCOUNT_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '805' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STG_SCHEME_SKU] ON STG_SCHEME_SKU REBUILD WITH (FILLFACTOR = 80)
Print '806' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STOCK_BATCH] ON STOCK_BATCH REBUILD WITH (FILLFACTOR = 80)
Print '807' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STOCK_BATCH_DAILY_1] ON STOCK_BATCH_DAILY REBUILD WITH (FILLFACTOR = 80)
Print '808' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STOCK_RECEIPT_STATUS] ON STOCK_RECEIPT_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '809' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STOCKCOMPARISON] ON STOCKCOMPARISON REBUILD WITH (FILLFACTOR = 80)
Print '810' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_STRATA] ON STRATA REBUILD WITH (FILLFACTOR = 80)
Print '811' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SUB_BILLING_STATUS] ON SUB_BILLING_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '812' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SUB_CHANNEL] ON SUB_CHANNEL REBUILD WITH (FILLFACTOR = 80)
Print '813' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SUB_ELEMENT] ON SUB_ELEMENT REBUILD WITH (FILLFACTOR = 80)
Print '814' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SUB_LOCALITY] ON SUB_LOCALITY REBUILD WITH (FILLFACTOR = 80)
Print '815' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SUGGESTED_ORDER] ON SUGGESTED_ORDER REBUILD WITH (FILLFACTOR = 80)
Print '816' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SUGGESTED_ORDER_DETAIL] ON SUGGESTED_ORDER_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '817' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SURVEY_DETAIL] ON SURVEY_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '818' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_SURVEY_HEAD] ON SURVEY_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '819' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TABLE_RELATION] ON QS_TABLE_RELATION REBUILD WITH (FILLFACTOR = 80)
Print '820' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGET_CALENDAR] ON TARGET_CALENDAR REBUILD WITH (FILLFACTOR = 80)
Print '821' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGET_CATEGORY] ON TARGET_CATEGORY REBUILD WITH (FILLFACTOR = 80)
Print '822' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGET_DATE] ON TARGET_DATE REBUILD WITH (FILLFACTOR = 80)
Print '823' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGET_DETAIL] ON TARGET_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '824' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGET_FOR] ON TARGET_FOR REBUILD WITH (FILLFACTOR = 80)
Print '825' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGET_HEAD] ON TARGET_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '826' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGET_HIERARCHY] ON TARGET_HIERARCHY REBUILD WITH (FILLFACTOR = 80)
Print '827' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGET_PERIOD] ON TARGET_PERIOD REBUILD WITH (FILLFACTOR = 80)
Print '828' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGET_SETUP] ON TARGET_SETUP REBUILD WITH (FILLFACTOR = 80)
Print '829' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGET_TYPE] ON TARGET_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '830' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TargetFor_Brand] ON TargetFor_Brand REBUILD WITH (FILLFACTOR = 80)
Print '831' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGETPERCENTAGE] ON TARGETPERCENTAGE REBUILD WITH (FILLFACTOR = 80)
Print '832' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TargetPercentage_Brand] ON TargetPercentage_Brand REBUILD WITH (FILLFACTOR = 80)
Print '833' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGETS] ON TARGETS REBUILD WITH (FILLFACTOR = 80)
Print '834' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGETS_DETAIL] ON TARGETS_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '835' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGETS_DETAIL_TEMP] ON TARGETS_DETAIL_TEMP REBUILD WITH (FILLFACTOR = 80)
Print '836' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TARGETS_TEMP] ON TARGETS_TEMP REBUILD WITH (FILLFACTOR = 80)
Print '837' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TAX_DETAIL] ON TAX_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '838' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TAX_HEADER] ON TAX_HEADER REBUILD WITH (FILLFACTOR = 80)
Print '839' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TAX_INVOICE] ON TAX_INVOICE REBUILD WITH (FILLFACTOR = 80)
Print '840' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TAX_NUMBER_BOOK] ON TAX_BOOK REBUILD WITH (FILLFACTOR = 80)
Print '841' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TAX_POLICY] ON TAX_POLICY REBUILD WITH (FILLFACTOR = 80)
Print '842' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TAX_POLICY_SPLIT] ON TAX_POLICY_SPLIT REBUILD WITH (FILLFACTOR = 80)
Print '843' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TEMP_PK_FK] ON TEMP_PK_FK REBUILD WITH (FILLFACTOR = 80)
Print '844' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TEMP_POP_STATUS] ON TEMP_POP_STATUS REBUILD WITH (FILLFACTOR = 80)
Print '845' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TOWN] ON TOWN REBUILD WITH (FILLFACTOR = 80)
Print '846' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TRANS_DETAIL] ON TRANS_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '847' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_TransactionType] ON TransactionType REBUILD WITH (FILLFACTOR = 80)
Print '848' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Transportation_detail] ON Transportation_detail REBUILD WITH (FILLFACTOR = 80)
Print '849' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Transportation_head] ON Transportation_head REBUILD WITH (FILLFACTOR = 80)
Print '850' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_Update_Log] ON Update_Log REBUILD WITH (FILLFACTOR = 80)
Print '851' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_USER_DISTRIBUTOR_MAPPING] ON USER_DISTRIBUTOR_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '852' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_USER_DISTRIBUTOR_MAPPING_LOG] ON USER_DISTRIBUTOR_MAPPING_LOG REBUILD WITH (FILLFACTOR = 80)
Print '853' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_USER_LOG] ON USER_LOG REBUILD WITH (FILLFACTOR = 80)
Print '854' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_UserDetail] ON MBZ_MOQualifiers REBUILD WITH (FILLFACTOR = 80)
Print '855' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_USERS] ON USERS REBUILD WITH (FILLFACTOR = 80)
Print '856' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_USERS_PASS_HIS] ON USERS_PASS_HIS REBUILD WITH (FILLFACTOR = 80)
Print '857' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VEHICLE] ON VEHICLE REBUILD WITH (FILLFACTOR = 80)
Print '858' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VEHICLE_SUPPLIER] ON VEHICLE_SUPPLIER REBUILD WITH (FILLFACTOR = 80)
Print '859' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VEHICLETYPE] ON VEHICLETYPE REBUILD WITH (FILLFACTOR = 80)
Print '860' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VERSION_CONTROL] ON VERSION_CONTROL_HEAD REBUILD WITH (FILLFACTOR = 80)
Print '861' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VERSION_CONTROLDTL] ON VERSION_CONTROL_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '862' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VG_EMPLOYEE_ALL_DED_VARIABLE_INCENTIVE] ON VG_EMPLOYEE_ALL_DED_VARIABLE_INCENTIVE REBUILD WITH (FILLFACTOR = 80)
Print '863' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VG_PROCESS] ON VG_PROCESS REBUILD WITH (FILLFACTOR = 80)
Print '864' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VG_SALES_TARGET] ON VG_SALES_TARGET REBUILD WITH (FILLFACTOR = 80)
Print '865' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VG_SKU_Penetration_Target] ON VG_SKU_Penetration_Target REBUILD WITH (FILLFACTOR = 80)
Print '866' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VG_VARIABLE_INCENTIVE_DETAIL] ON VG_VARIABLE_INCENTIVE_DETAIL REBUILD WITH (FILLFACTOR = 80)
Print '867' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VG_VARIABLE_INCENTIVE_MASTER] ON VG_VARIABLE_INCENTIVE_MASTER REBUILD WITH (FILLFACTOR = 80)
Print '868' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VG_VARIABLE_INCENTIVE_TARGET] ON VG_VARIABLE_INCENTIVE_TARGET REBUILD WITH (FILLFACTOR = 80)
Print '869' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VISIL_TYPE] ON VISIL_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '870' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_VISIT_TYPE] ON VISIT_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '871' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_WAREHOUSE] ON WAREHOUSE REBUILD WITH (FILLFACTOR = 80)
Print '872' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_WAREHOUSE_DISTRIBUTOR_MAPPING] ON WAREHOUSE_DISTRIBUTOR_MAPPING REBUILD WITH (FILLFACTOR = 80)
Print '873' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_WAREHOUSE_TYPE] ON WAREHOUSE_TYPE REBUILD WITH (FILLFACTOR = 80)
Print '874' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_xdBIETLGetSP] ON xdBIETLGetSP REBUILD WITH (FILLFACTOR = 80)
Print '875' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_xoCustomerApplicationStatus] ON xoCustomerApplicationStatus REBUILD WITH (FILLFACTOR = 80)
Print '876' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_xoDTMigration] ON xoDTMigration REBUILD WITH (FILLFACTOR = 80)
Print '877' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_xoMasterDataCTLog] ON xoMasterDataCTLog REBUILD WITH (FILLFACTOR = 80)
Print '878' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_xoNormMappings] ON xoNormMappings REBUILD WITH (FILLFACTOR = 80)
Print '879' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_xoRouteBook] ON xoRouteBook REBUILD WITH (FILLFACTOR = 80)
Print '880' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PK_xoXnappTransactionTimesLog] ON xoXnappTransactionTimesLog REBUILD WITH (FILLFACTOR = 80)
Print '881' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PKAC_BNKRECONMASTER] ON AC_GL_RM_BNKRECONMASTER REBUILD WITH (FILLFACTOR = 80)
Print '882' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PKRD_BNKRECDTL] ON AC_GL_RD_BNKRECONDETAIL REBUILD WITH (FILLFACTOR = 80)
Print '883' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [PKRoles] ON MBZ_Roles REBUILD WITH (FILLFACTOR = 80)
Print '884' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtAlertEmails_PK] ON RtAlertEmails REBUILD WITH (FILLFACTOR = 80)
Print '885' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtAttendanceDetails_PK] ON RtAttendanceDetails REBUILD WITH (FILLFACTOR = 80)
Print '886' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtBusinessTypeParameters_PK] ON RtBusinessTypeParameters REBUILD WITH (FILLFACTOR = 80)
Print '887' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCouponMaster_PK] ON RtCouponMaster REBUILD WITH (FILLFACTOR = 80)
Print '888' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCouponQuota_PK] ON RtCouponQuota REBUILD WITH (FILLFACTOR = 80)
Print '889' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCstEmptiesTrnDetail_PK] ON RtCstEmptiesTrnDetail REBUILD WITH (FILLFACTOR = 80)
Print '890' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCstEmptiesTrnHeader_PK] ON RtCstEmptiesTrnHeader REBUILD WITH (FILLFACTOR = 80)
Print '891' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCstInStoreDetails_PK] ON RtCstInStoreDetails REBUILD WITH (FILLFACTOR = 80)
Print '892' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCstInStoreSummary_PK] ON RtCstInStoreSummary REBUILD WITH (FILLFACTOR = 80)
Print '893' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCstOpControl_Log_PK] ON RtCstOpControl_Log REBUILD WITH (FILLFACTOR = 80)
Print '894' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCstOrderPromoDetail_PK] ON RtCstOrderPromoDetail REBUILD WITH (FILLFACTOR = 80)
Print '895' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCstOrderTaxDetail_PK] ON RtCstOrderTaxDetail REBUILD WITH (FILLFACTOR = 80)
Print '896' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCustomerCouponMapping_PK] ON RtCustomerCouponMapping REBUILD WITH (FILLFACTOR = 80)
Print '897' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCustomerCouponStatus_PK] ON RtCustomerCouponStatus REBUILD WITH (FILLFACTOR = 80)
Print '898' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCustomerLoyaltyTransaction_PK] ON RtCustomerLoyaltyTransaction REBUILD WITH (FILLFACTOR = 80)
Print '899' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCustomerShipments_PK] ON RtCustomerShipments REBUILD WITH (FILLFACTOR = 80)
Print '900' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCustomerWallet_PK] ON RtCustomerWallet REBUILD WITH (FILLFACTOR = 80)
Print '901' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCustomerWalletDetails_PK] ON RtCustomerWalletDetails REBUILD WITH (FILLFACTOR = 80)
Print '902' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtCustomerWalletTransaction_PK] ON RtCustomerWalletTransaction REBUILD WITH (FILLFACTOR = 80)
Print '903' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtHSNMaster_PK] ON RtHSNMaster REBUILD WITH (FILLFACTOR = 80)
Print '904' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtLocationCategory_PK] ON RtLocationCategory REBUILD WITH (FILLFACTOR = 80)
Print '905' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtOTPTransaction_PK] ON RtOTPTransaction REBUILD WITH (FILLFACTOR = 80)
Print '906' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtPrincipleLogo_PK] ON RtPrincipleLogo REBUILD WITH (FILLFACTOR = 80)
Print '907' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtPromotionAgreement_PK] ON RtPromotionAgreement REBUILD WITH (FILLFACTOR = 80)
Print '908' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtRealtimeMessaging_PK] ON RtRealtimeMessaging REBUILD WITH (FILLFACTOR = 80)
Print '909' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtSalesmanCategory_PK] ON RtSalesmanCategory REBUILD WITH (FILLFACTOR = 80)
Print '910' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtSalesmanChecklistResponse_PK] ON RtSalesmanChecklistResponse REBUILD WITH (FILLFACTOR = 80)
Print '911' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtSalesmanLeaveRequest_PK] ON RtSalesmanLeaveRequest REBUILD WITH (FILLFACTOR = 80)
Print '912' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtSchemeAchievement_PK] ON RtSchemeAchievement REBUILD WITH (FILLFACTOR = 80)
Print '913' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtServicedByCustomerMapping_PK] ON RtServicedByCustomerMapping REBUILD WITH (FILLFACTOR = 80)
Print '914' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtSMTPMapping_PK] ON RtSMTPMapping REBUILD WITH (FILLFACTOR = 80)
Print '915' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtSMTPServer_PK] ON RtSMTPServer REBUILD WITH (FILLFACTOR = 80)
Print '916' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtStateMaster_PK] ON RtStateMaster REBUILD WITH (FILLFACTOR = 80)
Print '917' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtTAXAttribution_PK] ON RtTAXAttribution REBUILD WITH (FILLFACTOR = 80)
Print '918' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [RtTAXType_PK] ON RtTAXType REBUILD WITH (FILLFACTOR = 80)
Print '919' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [UQ__QS_VERSI__C59DEC56C6548178] ON QS_VERSION REBUILD WITH (FILLFACTOR = 80)
Print '920' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [UQ_TAX_BOOK_INDEX] ON TAX_BOOK REBUILD WITH (FILLFACTOR = 80)
Print '921' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdLocationDocuments_PK] ON xdLocationDocuments REBUILD WITH (FILLFACTOR = 80)
Print '922' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdLocationPromotionQuota_PK] ON xdLocationPromotionQuota REBUILD WITH (FILLFACTOR = 80)
Print '923' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdModuleFlow_PK] ON xdModuleFlow REBUILD WITH (FILLFACTOR = 80)
Print '924' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdNormDefinition_PK] ON xdNormDefinition REBUILD WITH (FILLFACTOR = 80)
Print '925' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdOutletEmptiesTrnDetail_PK] ON xdOutletEmptiesTrnDetail REBUILD WITH (FILLFACTOR = 80)
Print '926' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdOutletEmptiesTrnHeader_PK] ON xdOutletEmptiesTrnHeader REBUILD WITH (FILLFACTOR = 80)
Print '927' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdPickListHeader_PK] ON xdPickListHeader REBUILD WITH (FILLFACTOR = 80)
Print '928' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdProductCategoryImage_PK] ON xdProductCategoryImage REBUILD WITH (FILLFACTOR = 80)
Print '929' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdProductHierarchyImage_PK] ON xdProductHierarchyImage REBUILD WITH (FILLFACTOR = 80)
Print '930' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdProductImage_PK] ON xdProductImage REBUILD WITH (FILLFACTOR = 80)
Print '931' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdPromotionControlImage_PK] ON xdPromotionControlImage REBUILD WITH (FILLFACTOR = 80)
Print '932' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdSalesAnalysis_PK] ON xdSalesAnalysis REBUILD WITH (FILLFACTOR = 80)
Print '933' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdSearchBlockMaster_PK] ON xdSearchBlockMaster REBUILD WITH (FILLFACTOR = 80)
Print '934' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdSearchTagMaster_PK] ON xdSearchTagMaster REBUILD WITH (FILLFACTOR = 80)
Print '935' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdServiceRequest_PK] ON xdServiceRequest REBUILD WITH (FILLFACTOR = 80)
Print '936' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xdUOM_PK] ON xdUOM REBUILD WITH (FILLFACTOR = 80)
Print '937' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoCstChangeDetail_PK] ON xoCstChangeDetail REBUILD WITH (FILLFACTOR = 80)
Print '938' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoCstGeoCode_PK] ON xoCstGeoCode REBUILD WITH (FILLFACTOR = 80)
Print '939' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoCustomerFavourites_PK] ON xoCustomerFavourites REBUILD WITH (FILLFACTOR = 80)
Print '940' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoCustomerInfo_PK] ON xoCustomerInfo REBUILD WITH (FILLFACTOR = 80)
Print '941' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoCustomerNotifications_PK] ON xoCustomerNotifications REBUILD WITH (FILLFACTOR = 80)
Print '942' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoCustomerNotificationsMapping_PK] ON xoCustomerNotificationsMapping REBUILD WITH (FILLFACTOR = 80)
Print '943' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoCustomerNotificationStatus_PK] ON xoCustomerNotificationStatus REBUILD WITH (FILLFACTOR = 80)
Print '944' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoDocuments_PK] ON xoDocuments REBUILD WITH (FILLFACTOR = 80)
Print '945' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoGiftMaster_PK] ON xoGiftMaster REBUILD WITH (FILLFACTOR = 80)
Print '946' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoHeldOrder_PK] ON xoHeldOrder REBUILD WITH (FILLFACTOR = 80)
Print '947' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoRetailerInfo_PK] ON xoRetailerInfo REBUILD WITH (FILLFACTOR = 80)
Print '948' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoSignedAgreement_PK] ON xoSignedAgreement REBUILD WITH (FILLFACTOR = 80)
Print '949' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoSODetail_PK] ON xoSODetail REBUILD WITH (FILLFACTOR = 80)
Print '950' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoSOHeader_PK] ON xoSOHeader REBUILD WITH (FILLFACTOR = 80)
Print '951' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoSOPromoDetail_PK] ON xoSOPromoDetail REBUILD WITH (FILLFACTOR = 80)
Print '952' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoSOTaxDetail_PK] ON xoSOTaxDetail REBUILD WITH (FILLFACTOR = 80)
Print '953' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoSurveyResponse_PK] ON xoSurveyResponse REBUILD WITH (FILLFACTOR = 80)
Print '954' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoSyncTables_PK] ON xoSyncTables REBUILD WITH (FILLFACTOR = 80)
Print '955' + ' - ' + Cast( GetDate() as varchar)
GO
ALTER INDEX [xoXnappTransaction_PK] ON xoXnappTransaction REBUILD WITH (FILLFACTOR = 80)
Print '956' + ' - ' + Cast( GetDate() as varchar)
GO
