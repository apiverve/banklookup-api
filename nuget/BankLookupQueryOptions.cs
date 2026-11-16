using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.BankLookup
{
    /// <summary>
    /// Query options for the Bank Lookup API
    /// </summary>
    public class BankLookupQueryOptions
    {
        /// <summary>
        /// Institution name or part of it; former and trade names match too
        /// </summary>
        [JsonProperty("name")]
        public string Name { get; set; }

        /// <summary>
        /// Our institution id, e.g. fdic-3511 or ncua-5536
        /// </summary>
        [JsonProperty("id")]
        public string Id { get; set; }

        /// <summary>
        /// FDIC certificate number
        /// </summary>
        [JsonProperty("fdicCert")]
        public string FdicCert { get; set; }

        /// <summary>
        /// NCUA credit union charter number
        /// </summary>
        [JsonProperty("ncuaCharter")]
        public string NcuaCharter { get; set; }

        /// <summary>
        /// Nine-digit ABA routing number
        /// </summary>
        [JsonProperty("routing")]
        public string Routing { get; set; }

        /// <summary>
        /// SWIFT/BIC code (8 or 11 characters); non-US codes answer from our SWIFT directory
        /// </summary>
        [JsonProperty("swift")]
        public string Swift { get; set; }

        /// <summary>
        /// Legal Entity Identifier (20 characters)
        /// </summary>
        [JsonProperty("lei")]
        public string Lei { get; set; }

        /// <summary>
        /// Website domain, URL or email address of the institution
        /// </summary>
        [JsonProperty("domain")]
        public string Domain { get; set; }

        /// <summary>
        /// IBAN; names the bank where the IBAN carries a BIC-style bank code (GB, IE, NL and others)
        /// </summary>
        [JsonProperty("iban")]
        public string Iban { get; set; }

        /// <summary>
        /// Two-letter US state of the headquarters, to narrow a name search
        /// </summary>
        [JsonProperty("state")]
        public string State { get; set; }

        /// <summary>
        /// Narrow a name search to one institution type
        /// </summary>
        [JsonProperty("type")]
        public string Type { get; set; }

        /// <summary>
        /// active, inactive (merged, failed or closed) or any; any searches active institutions first and falls back to closed ones
        /// </summary>
        [JsonProperty("status")]
        public string Status { get; set; }

        /// <summary>
        /// Two-letter country code; a non-US country searches banks by name in our SWIFT directory
        /// </summary>
        [JsonProperty("country")]
        public string Country { get; set; }

        /// <summary>
        /// Include the branch list for the first five institutions
        /// </summary>
        [JsonProperty("branches")]
        public bool? Branches { get; set; }

        /// <summary>
        /// Maximum institutions to return (1-50)
        /// </summary>
        [JsonProperty("limit")]
        public int? Limit { get; set; }
    }
}
