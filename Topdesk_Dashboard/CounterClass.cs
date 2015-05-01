using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Topdesk_Dashboard
{
    /// <remarks/>
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "CountListClass", IsNullable = false)]
    [Serializable]
    public partial class CounterClass
    {
        private byte countField;
        private System.DateTime dateField;
        /// <remarks/>
        public byte Count
        {
            get
            {
                return this.countField;
            }
            set
            {
                this.countField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "date")]
        public System.DateTime Date
        {
            get
            {
                return this.dateField;
            }
            set
            {
                this.dateField = value;
            }
        }
    }
}
