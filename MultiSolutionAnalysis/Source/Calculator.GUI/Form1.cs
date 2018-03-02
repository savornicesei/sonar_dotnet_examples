using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Calculator.GUI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            string strA = txtA.Text.Trim();
            string strB = txtB.Text.Trim();

            int a, b, result;
            if (int.TryParse(strA, out a) && int.TryParse(strB, out b))
            {
                Dll1.Calculator c = new Dll1.Calculator();
                result = c.Add(a, b);
                txtResult.Text = result.ToString();
            }
            else
            {
                Log("Invalid input");
            }

        }

        private void Log(string message)
        {
            rtbMessage.Text += Environment.NewLine + DateTime.Now.ToShortTimeString() + ", " + message;
        }
    }
}
