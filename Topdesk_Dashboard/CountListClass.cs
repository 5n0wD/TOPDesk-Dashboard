using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace Topdesk_Dashboard
{
    [Serializable]
    public class CountListClass
    {
        [XmlArray("CountList"), XmlArrayItem(typeof(CounterClass), ElementName = "CountInfo")]
        public List<CounterClass> CountList { get; set; }

    }
}