declare module '@apiverve/banklookup' {
  export interface banklookupOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface banklookupResponse {
    status: string;
    error: string | null;
    data: BankLookupData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface BankLookupData {
      count:        number | null;
      totalMatches: number | null;
      banks:        Bank[];
      routingCheck: null;
      ibanCheck:    null;
  }
  
  interface Bank {
      id:                null | string;
      name:              null | string;
      aliases:           (null | string)[];
      type:              null | string;
      charterClass:      null | string;
      status:            null | string;
      statusDate:        null;
      successor:         null;
      establishedDate:   Date | null;
      foundedYear:       number | null;
      address:           null | string;
      city:              null | string;
      state:             null | string;
      zip:               null | string;
      county:            null | string;
      country:           null | string;
      latitude:          number | null;
      longitude:         number | null;
      coordinatesSource: null | string;
      website:           null | string;
      domain:            null | string;
      phone:             null;
      regulator:         null | string;
      insurer:           null | string;
      fdicCERT:          number | null;
      ncuaCharter:       null;
      rssdID:            number | null;
      lei:               null | string;
      holdingCompany:    null | string;
      routingNumbers:    (null | string)[];
      swiftCodes:        (null | string)[];
      branchCount:       number | null;
      totalAssets:       number | null;
      totalDeposits:     number | null;
      netIncomeYtd:      number | null;
      members:           null;
      financialsAsOf:    Date | null;
      failure:           null;
  }

  export default class banklookupWrapper {
    constructor(options: banklookupOptions);

    execute(callback: (error: any, data: banklookupResponse | null) => void): Promise<banklookupResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: banklookupResponse | null) => void): Promise<banklookupResponse>;
    execute(query?: Record<string, any>): Promise<banklookupResponse>;
  }
}
