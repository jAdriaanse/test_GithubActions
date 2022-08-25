using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ButtonPress : MonoBehaviour
{

    [SerializeField] private string[] indexedText;
    [SerializeField] private Text editableText;

    private int counter;

    // Start is called before the first frame update
    void Start()
    {
        editableText.text = indexedText[0];
        counter = 0;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void OnButtonPress()
    {
        if (counter < 5)
        {
            counter++;
        }
        else
        {
            counter = 0;
        }

        editableText.text = indexedText[counter];
    }
}
