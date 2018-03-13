
module IB
  module Messages
    module Outgoing

      RequestManagedAccounts = def_message 17

      # @data = { :subscribe => boolean,
      #           :account_code => Advisor accounts only. Empty ('') for a standard account. }
      RequestAccountUpdates = RequestAccountData = def_message([6, 2],
                                                               [:subscribe, true],
                                                               :account_code)
=begin
  Call this method to request and keep up to date the data that appears
        on the TWS Account Window Summary tab. The data is returned by
        accountSummary().

        Note:   This request is designed for an FA managed account but can be
        used for any multi-account structure.

        reqId:int - The ID of the data request. Ensures that responses are matched
            to requests If several requests are in process.
        groupName:str - Set to All to returnrn account summary data for all
            accounts, or set to a specific Advisor Account Group name that has
            already been created in TWS Global Configuration.
        tags:str - A comma-separated list of account tags.  Available tags are:
            accountountType
            NetLiquidation,
            TotalCashValue - Total cash including futures pnl
            SettledCash - For cash accounts, this is the same as
            TotalCashValue
            AccruedCash - Net accrued interest
            BuyingPower - The maximum amount of marginable US stocks the
                account can buy
            EquityWithLoanValue - Cash + stocks + bonds + mutual funds
            PreviousDayEquityWithLoanValue,
            GrossPositionValue - The sum of the absolute value of all stock
                and equity option positions
            RegTEquity,
            RegTMargin,
            SMA - Special Memorandum Account
            InitMarginReq,
            MaintMarginReq,
            AvailableFunds,
            ExcessLiquidity,
            Cushion - Excess liquidity as a percentage of net liquidation value
            FullInitMarginReq,
            FullMaintMarginReq,
            FullAvailableFunds,
            FullExcessLiquidity,
            LookAheadNextChange - Time when look-ahead values take effect
            LookAheadInitMarginReq,
            LookAheadMaintMarginReq,
            LookAheadAvailableFunds,
            LookAheadExcessLiquidity,
            HighestSeverity - A measure of how close the account is to liquidation
            DayTradesRemaining - The Number of Open/Close trades a user
                could put on before Pattern Day Trading is detected. A value of "-1"
                means that the user can put on unlimited day trades.
            Leverage - GrossPositionValue / NetLiquidation
            $LEDGER - Single flag to relay all cash balance tags*, only in base
                currency.
            $LEDGER:CURRENCY - Single flag to relay all cash balance tags*, only in
                the specified currency.
            $LEDGER:ALL - Single flag to relay all cash balance tags* in all
            currencies.

=end
					RequestAccountSummary = 
						def_message( 62,
											 # request_id required
						[:group, 'All'],
						:tags )

					CancelAccountSummary	=  def_message 63   # request_id  required
					RequestPositions			=  def_message 61
					CancelPositions				=  def_message 64

		
					RequestPositionsMulti = def_message( 74, # request_id required
						 :account,
						 [:model_code, nil ] )

					CancelPositionsMulti = def_message 75   # request_id required

					RequestAccountUpdatesMulti = def_message( 76, # request_id required
						 :account,																# account or account-group	
						 [:model_code, nil],
						 [ :leger_and_nlv, nil ])
					CancelAccountUpdatesMulti = def_message 77   # request_id required
		end # module outgoing
	end # module messages 
end # module ib

#     REQ_POSITIONS                 = 61
#     REQ_ACCOUNT_SUMMARY           = 62
#     CANCEL_ACCOUNT_SUMMARY        = 63
#     CANCEL_POSITIONS              = 64

#     REQ_ACCOUNT_UPDATES_MULTI     = 76
#     CANCEL_ACCOUNT_UPDATES_MULTI  = 77